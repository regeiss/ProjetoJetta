//
//  ListaAbstecimentoScreen.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 21/05/23.
//

import SwiftUI
import RealmSwift
import UIPilot

@available(iOS 16.0, *)
struct ListaAbastecimentoScreen: View
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
                    ListaAbastecimentoDetalheView(abastecimento: abastecimento)
                }
            }
        }
        .navigationBarTitle("Abastecimento", displayMode: .automatic)
        .toolbar { ToolbarItem(placement: .navigationBarTrailing)
            { Button {
                pilot.push(.edicaoAbastecimento(abastecimento: Abastecimento()))
            }
                label: { Image(systemName: "plus")}}
        }
    }
}
