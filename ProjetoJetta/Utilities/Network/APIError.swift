//
//  APIError.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 04/06/23.
//

import Foundation

enum APIError: String, Error
{
    case jsonDecoding
    case response
    case noInternet
}
