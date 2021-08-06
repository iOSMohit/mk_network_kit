//
//  ViewController.swift
//  ExampleApp
//
//  Created by Mohit Kumar on 06/08/21.
//

import UIKit
import MKNetworking

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        callApi()
//        getUsers()
        
        loginUser()
    }
    
    private func callApi(){
        NetworkManager.shared.getResponse(for: NetworkWrapper.APIEnpoints.getPosts) { (result: Result<[PostModel],NetworkError>) in
            switch result{
            case .failure(let err):
                print(err)
                
            case .success(let response):
                print(response)
            }
        }
    }
    
    private func getUsers(){
        NetworkManager.shared.getResponse(for: NetworkWrapper.APIEnpoints.getUsers) { (result: Result<[UserModel], NetworkError>) in
            switch result{
            case .failure(let err):
                print(err)
                
            case .success(let users):
                for user in users{
                    print(user)
                }
            }
        }
    }
    
    private func loginUser(){
        let requestObj = LoginRequestModel.init(email: "developer.mohitkmr@gmail.com", password: "Deepikaa")
        
        NetworkManager.shared.postRequest(for: NetworkWrapper.APIEnpoints.login, requestData: requestObj, headers: NetworkWrapper.headers) { (result: Result<LoginResponseModel, NetworkError>) in
            switch result{
            case .failure(let err):
                print(err)
                
            case .success(let loginRes):
                print(loginRes)
            }
        }
    }
}

struct NetworkWrapper{
    
    static var headers = ["Authorization" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3NUb2tlblVzZXJJZCI6ImRlMjQ5OWJhY2MxMjUwMTI2ZWI4ZWMxNTZkMDE1YTJiMWFmMGU5NDdkMTAyZWQ2Y2QwYTEzZGFiMjc2YmI3M2YiLCJpYXQiOjE2MjI5NzM5ODl9.oLE_oT-_v-6K-mpeR0yPk2k3WYYaiMCf75KGZ0sXLJw","Content-Type": "application/json"]
    
    mutating func addHeaderField(key:String,value:String){
        NetworkWrapper.headers[key] = value
    }
    
    enum APIEnpoints: EndPoints{
        
        //Placeholder Apis
        case getPosts
        case getUsers
        
        //Auth
        case login
        
        var value: String{
            switch self {
            case .getPosts:
                return "/posts"
            case .getUsers:
                return "/users"
                
            case .login:
                return "/login"
            }
        }
    }
}

//MARK:- App Models

struct PostModel: Decodable{
    var userId:Int
    var id:Int
    var title:String
    var body:String
}

struct UserModel: Decodable{
    var id:Int
    var name:String
    var username:String
    var email:String
    var address: UserAddress
    var phone:String
    var website:String
    var company: UserCompany
    
    struct UserAddress: Decodable {
        var street:String
        var suite:String
        var city:String
        var zipcode:String
        var geo: UserAddressGeoLocation
        
        struct UserAddressGeoLocation: Decodable{
            var lat:String
            var lng:String
        }
    }
    
    struct UserCompany: Decodable{
        var name:String
        var catchPhrase:String
        var bs:String
    }
}

struct RegisterRequestModel: Encodable{
    var firstName:String
    var lastName:String
    var email:String
    var password:String
}

protocol BaseResponseModel: Decodable {
    var success:Bool{get set}
    var message:String{get set}
}

struct LoginResponseModel: BaseResponseModel{
    var success: Bool
    var message: String
    var data: LoginResponseDataModel?
    
    struct LoginResponseDataModel: Decodable{
        var id:String
        var firstName:String
        var lastName:String
        var email:String
        var accessToken:String
    }
}

struct LoginRequestModel: Encodable{
    var email:String
    var password:String
}
