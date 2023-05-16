//
//  VeiculoView.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 12/05/23.
//

import SwiftUI
import UIPilot

@available(iOS 16.0, *)
struct VeiculoScreen: View
{
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    @StateObject private var viewModel = VeiculoViewModel()
    
    var body: some View
    {
        VStack
        {
            Text("Veiculo")
            
        }.navigationTitle("Veículo")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarRole(.navigationStack)
        .onAppear { save()}
            
    }
    
    func save()
    {
        let veiculo = Veiculo()
        
        veiculo.name = "Jetta"
        veiculo.marca = "VW"
        veiculo.modelo = "Sedan"
        veiculo.ano = 2008
        veiculo.placa = "IOP7I24"
        veiculo.chassis = "VW3HYTV213"
        veiculo.ativo = false
        veiculo.padrao = false
        viewModel.saveObject(veiculo: veiculo)
    }
}
