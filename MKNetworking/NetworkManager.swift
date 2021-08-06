//
//  NetworkManager.swift
//  MKNetworking
//
//  Created by Mohit Kumar on 02/08/21.
//

import Foundation

public enum NetworkError: Error,LocalizedError{
    case invalidUrl
    case error(Error)
    case invalidResponse
    case noData
    
    public var errorDescription: String?{
        switch self {
        case .invalidUrl:
            return "Please provide valid url"
            
        case .noData:
            return "There is no response data"
            
        case .invalidResponse:
            return "Status code returned is not valid"
        
        case .error(let err):
            return err.localizedDescription
            
        }
    }
}

private enum MethodType{
    case get,post
    
    var type:String{
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
            
        }
    }
}

public protocol EndPoints{
    var value:String{get}
}

public final class NetworkManager{
    
    public static let shared = NetworkManager()
    private let jsonDecoder = JSONDecoder()
    private var baseUrl:String!
    
    private init(){
        
    }
    
    public func setBaseUrl(to urlString:String){
        self.baseUrl = urlString
    }
    
    //MARK:- Get
    
    public func getResponse<D>(for endPoint: EndPoints,params: [String:String]? = nil, headers: [String:String]? = nil, onCompletion: @escaping (Result<D, NetworkError>)-> Void) where D : Decodable{
        guard var urlComponent = URLComponents(string: self.baseUrl+endPoint.value) else{
            onCompletion(.failure(.invalidUrl))
            return
        }
        
        if let param = params{
            urlComponent.setQueryItems(with: param)
        }
        
        var request = URLRequest(url: urlComponent.url!)
        request.httpMethod = MethodType.get.type
        request.allHTTPHeaderFields = headers
        request.timeoutInterval = 30
        
        let downloadDataTask = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let err = error{
                onCompletion(.failure(.error(err)))
            }else if let httpResponse = response as? HTTPURLResponse, 200..<299 ~= httpResponse.statusCode {
                do {
                    guard let responseData = data else{
                        onCompletion(.failure(.noData))
                        return
                    }
                    
                    guard let self = self else {return}
                    
                    let sucessResult = try self.jsonDecoder.decode(D.self, from: responseData)
                    
                    onCompletion(.success(sucessResult))
                } catch let err {
                    onCompletion(.failure(.error(err)))
                }
            }else{
                onCompletion(.failure(.invalidResponse))
            }
        }
        
        downloadDataTask.resume()
    }
    
    public func postRequest<R: Encodable, D: Decodable>(for endPoint:EndPoints,requestData: R, headers: [String:String]? = nil, onCompletion: @escaping (Result<D, NetworkError>)-> Void){
        guard let url = URL(string: baseUrl+endPoint.value) else {
            onCompletion(.failure(.noData))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = MethodType.post.type
        urlRequest.allHTTPHeaderFields = headers
        
        do {
            let jsonData = try JSONEncoder().encode(requestData)
            
            urlRequest.httpBody = jsonData
            urlRequest.timeoutInterval = 30
            
            let urlRequest = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
                if let err = error{
                    onCompletion(.failure(.error(err)))
                }else if let httpResponse = response as? HTTPURLResponse, 200..<299 ~= httpResponse.statusCode {
                    do {
                        guard let responseData = data else{
                            onCompletion(.failure(.noData))
                            return
                        }
                        
                        guard let self = self else {return}
                        
                        let sucessResult = try self.jsonDecoder.decode(D.self, from: responseData)
                        
                        onCompletion(.success(sucessResult))
                    } catch let err {
                        onCompletion(.failure(.error(err)))
                    }
                }else{
                    onCompletion(.failure(.invalidResponse))
                }
            }
            
            urlRequest.resume()
        } catch let err {
            onCompletion(.failure(.error(err)))
        }
    }
}

extension URLComponents {
    
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
