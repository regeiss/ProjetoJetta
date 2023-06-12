//
//  ListaPostoDetalheView.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 23/05/23.
//

import SwiftUI
import UIPilot

struct PostoListaDetalheView: View
{
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    var posto: Posto
    
    var body: some View
    {
        HStack
        {
            Text(posto.nome ?? "")
            Text(posto.bandeira ?? "")
        }
        .onTapGesture {
            pilot.push(.edicaoPosto(posto: posto))
        }
    }
}
