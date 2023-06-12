//
//  PostoListaScreen.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 23/05/23.
//

import SwiftUI
import UIPilot

@available(iOS 16.0, *)
struct PostoListaScreen: View
{
    @StateObject private var viewModel = PostoViewModel()
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    
    var body: some View
    {
        List
        {
            ForEach(viewModel.postosLista) { posto in
                HStack
                {
                    PostoListaDetalheView(posto: posto)
                }
            }
            .onDelete(perform: deletePostos)
            if viewModel.postosLista.isEmpty
            {
                Text("").listRowBackground(Color.clear)
            }
        }
        .background(Color("backGroundMain"))
        .scrollContentBackground(.hidden)
        .navigationBarTitle("Postos", displayMode: .automatic)
        .toolbar { ToolbarItem(placement: .navigationBarTrailing)
            { Button {
                pilot.push(.adicaoPosto(posto: Posto()))
            }
                label: { Image(systemName: "plus")}}
        }
    }
    
    func deletePostos(at offsets: IndexSet)
    {
        for offset in offsets
        {
            let posto = viewModel.postosLista[offset]
            viewModel.delete(posto: posto)
        }
    }
}
