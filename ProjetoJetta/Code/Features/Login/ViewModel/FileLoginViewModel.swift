//
//  LoginViewModel.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 05/06/23.
//

import Foundation


class LoginViewModel: ObservableObject
{
    @Published var username: String = ""
    @Published var password: String = ""

    var error: APIError?
    
    func login()
    {
        LoginAction(
            parameters: LoginRequest(
                username: username,
                password: password
            )
        ).call { response in
            self.error = nil
            
            Auth.shared.setCredentials(
                accessToken: response.data.accessToken,
                refreshToken: response.data.refreshToken
            )
        } failure: { error in
            self.error = error
        }
    }
}
