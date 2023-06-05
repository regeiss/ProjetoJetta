//
//  LoginModel.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 05/06/23.
//

import Foundation

struct LoginRequest: Encodable
{
    let username: String
    let password: String
}

struct LoginResponse: Decodable
{
    let data: LoginResponseData
}

struct LoginResponseData: Decodable
{
    let accessToken: String
    let refreshToken: String
}

