//
//  APIRequest.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 04/06/23.
//

import Foundation
import Alamofire

struct Login: Decodable {
    let email: String
    let password: String
}

class APIRequest
{
    private var reachability: NetworkReachabilityManager!
    
    func call()
    {
        AF.request("https://jsonplaceholder.typicode.com/posts").responseDecodable(of: [Login].self)
        { response in
            switch response.result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
}
