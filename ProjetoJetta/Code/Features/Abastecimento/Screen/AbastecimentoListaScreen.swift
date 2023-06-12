//
//  ListaAbstecimentoScreen.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 21/05/23.
//

import SwiftUI
import UIPilot

@available(iOS 16.0, *)
struct AbastecimentoListaScreen: View
{
    @ObservedResults(Abastecimento.self, sortDescriptor: SortDescriptor(keyPath: "id", ascending: true)) var abastecimentos
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    
    var body: some View
    {
        List
        {
            ForEach(abastecimentos) { abastecimento in
                HStack
                {
                    AbastecimentoListaDetalheView(abastecimento: abastecimento)
                }
            }
            .onDelete(perform: $abastecimentos.remove(atOffsets:))
            if abastecimentos.isEmpty
            {
                Text("").listRowBackground(Color.clear)
            }
        }
        .background(Color("backGroundMain"))
        .scrollContentBackground(.hidden)
        .navigationBarTitle("Abastecimento", displayMode: .automatic)
        .toolbar { ToolbarItem(placement: .navigationBarTrailing)
            { Button {
                pilot.push(.edicaoAbastecimento(abastecimento: Abastecimento()))
            }
                label: { Image(systemName: "plus")}}
        }
    }
}
