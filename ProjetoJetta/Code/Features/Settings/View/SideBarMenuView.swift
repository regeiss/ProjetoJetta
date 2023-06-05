//
//  SideBarMenuView.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 12/05/23.
//

import SwiftUI
import UIPilot

struct SideMenuView: View
{
    @Binding var showMenu: Bool
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    let appBuild = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String

    var body: some View
    {
        VStack(alignment: .leading)
        {
            HStack
            {
                Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Login")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 30)
            .onTapGesture
            {
                showMenu = false
                pilot.push(.login)
            }
            HStack
            {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Perfil")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 30)
            .onTapGesture
            {
                showMenu = false
                // router.toListaPerfil()
            }
            HStack
            {
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Mensagens")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 30)
            .onTapGesture
            {
                showMenu = false
                // router.toMenu()
            }
            HStack
            {
                Image(systemName: "gearshape")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Configurações")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 30)
            .onTapGesture
            {
                showMenu = false
                pilot.push(.settings)
            }
            Spacer()
            HStack
            {
                Text("WerkstadtG v.")
                Text(appBuild ?? "1.0")
                    .foregroundColor(.gray)
            }.padding([.leading, .bottom])
        }
         .edgesIgnoringSafeArea(.all)
         .padding(.leading)
         .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
         .background(Color(red: 32/255, green: 32/255, blue: 32/255))
         
    }
}
