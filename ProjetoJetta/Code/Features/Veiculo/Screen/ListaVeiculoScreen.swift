//
//  ListaVeiculoScreen.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 16/05/23.
//

import SwiftUI
import RealmSwift
import UIPilot

struct ListaVeiculoScreen: View
{
    @ObservedResults(Veiculo.self, sortDescriptor: SortDescriptor(keyPath: "id", ascending: true)) var veiculos
    @EnvironmentObject var state: AppState
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    
    var body: some View
    {
        List
        {
            ForEach(veiculos) { veiculo in
                ListaVeiculoDetalheView(veiculo: veiculo)
            }
        }.navigationBarTitle("Veículos", displayMode: .automatic)
            .toolbar { ToolbarItem(placement: .navigationBarTrailing)
                { Button {
                    pilot.push(.edicaoVeiculo(Veiculo(), isEdit: false))
                }
                    label: { Image(systemName: "plus")}}
            }
    }
}
