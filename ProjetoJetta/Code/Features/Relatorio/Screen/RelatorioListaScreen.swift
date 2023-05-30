//
//  RelatorioListaScreen.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 29/05/23.
//

import SwiftUI
import RealmSwift
import UIPilot

@available(iOS 16.0, *)
struct RelatorioListaScreen: View
{
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    
    var body: some View
    {
        List
        {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .background(Color("backGroundMain"))
        .scrollContentBackground(.hidden)
        .navigationBarTitle("Relatórios", displayMode: .automatic)
        .toolbar { ToolbarItem(placement: .navigationBarTrailing)
            { Button {
                pilot.push(.listaServico)
            }
                label: { Image(systemName: "plus")}}
        }
    }
}
