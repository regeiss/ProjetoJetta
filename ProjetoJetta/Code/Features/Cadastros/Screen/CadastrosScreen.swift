//
//  CadastrosScreen.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 22/05/23.
//

import SwiftUI
import UIPilot

@available(iOS 16.0, *)
struct CadastrosScreen: View
{
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            VStack
            {
                DetalheCadastroView(titulo: "Categorias")
                    .onTapGesture
                    {
                        pilot.push(.root)
                    }
                DetalheCadastroView(titulo: "Serviços")
                    .onTapGesture
                    {
                        pilot.push(.root)
                    }
                DetalheCadastroView(titulo: "Veículos")
                    .onTapGesture
                    {
                        pilot.push(.veiculo)
                    }
                DetalheCadastroView(titulo: "Postos")
                    .onTapGesture
                    {
                        pilot.push(.root)
                    }
                
            }.padding()
            Spacer()
        }
    }
}
