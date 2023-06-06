//
//  PostoListaScreen.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 23/05/23.
//

import SwiftUI
import RealmSwift
import UIPilot

@available(iOS 16.0, *)
struct PostoListaScreen: View
{
    @ObservedResults(Posto.self, sortDescriptor: SortDescriptor(keyPath: "id", ascending: true)) var postos
    @StateObject private var viewModel = PostoViewModel()
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    
    var body: some View
    {
        List
        {
            ForEach(postos) { posto in
                HStack
                {
                    ListaPostoDetalheView(posto: posto)
                }
            }
            .onDelete(perform: $postos.remove(atOffsets:))
            if postos.isEmpty
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
}
