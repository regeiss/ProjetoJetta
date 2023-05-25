//
//  ListaPostoDetalheView.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 23/05/23.
//

import SwiftUI
import RealmSwift
import UIPilot

struct ListaPostoDetalheView: View
{
    @ObservedRealmObject var posto: Posto
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    
    var body: some View
    {
        HStack
        {
            Text(posto.nome)
            Text(posto.logo)
        }
        .onTapGesture {
            pilot.push(.edicaoPosto(posto: posto))
        }
    }
}
