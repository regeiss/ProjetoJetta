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
        ZStack(alignment: .leading)
        {
            Color("backGroundMain").edgesIgnoringSafeArea(.all)
            VStack
            {
                CadastroDetalheView(titulo: "Categorias")
                    .onTapGesture {
                    pilot.push(.root)}
                CadastroDetalheView(titulo: "Serviços")
                    .onTapGesture {
                    pilot.push(.root)}
                CadastroDetalheView(titulo: "Veículos")
                    .onTapGesture {
                    pilot.push(.listaVeiculo)}
                CadastroDetalheView(titulo: "Postos")
                    .onTapGesture {
                    pilot.push(.listaPosto)}
                Spacer()
            }.padding()
            
        }
    }
}
