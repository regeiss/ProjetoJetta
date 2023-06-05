//
//  LoginScreen.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 05/06/23.
//

import SwiftUI

struct LoginScreen: View
{
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View
    {
        VStack
        {
            Spacer()
            
            VStack
            {
                TextField("Login.UsernameField.Title".localized, text: $viewModel.username)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(.top, 20)
                
                Divider().foregroundColor(.white)
                
                SecureField("Login.PasswordField.Title".localized, text: $viewModel.password)
                .padding(.top, 20)
                
                Divider().foregroundColor(.white)
            }
            
            if viewModel.error == .noInternet
            {
                Text("No internet")
                    .fontWeight(.bold)
                    .foregroundColor(.red)
            }
            else if viewModel.error != nil
            {
                Text("Login error")
                    .fontWeight(.bold)
                    .foregroundColor(.red)
            }
            
            Spacer()
            
            Button(
                action: viewModel.login,
                label: {
                    Text("Login.LoginButton.Title".localized)
                        .modifier(MainButton())
                }
            )
        }
        .padding(20)
        .background(Color("backGroundMain")).edgesIgnoringSafeArea(.all)
    }
}
