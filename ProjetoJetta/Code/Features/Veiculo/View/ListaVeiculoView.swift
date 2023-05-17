//
//  ListaVeiculoView.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 16/05/23.
//

import SwiftUI
import RealmSwift

struct ListaVeiculoView: View
{
    @ObservedResults(Veiculo.self, sortDescriptor: SortDescriptor(keyPath: "id", ascending: true)) var veiculos
    @EnvironmentObject var state: AppState
    
    var body: some View
    {
        List
        {
            ForEach(veiculos) { veiculo in
                DetalheVeiculoView(veiculo: veiculo)
            }
        }.navigationTitle("Veículos")
            .toolbar { ToolbarItem(placement: .navigationBarTrailing) {
                Button("+") { print("Add")}
            }
            
            }
    }
}
