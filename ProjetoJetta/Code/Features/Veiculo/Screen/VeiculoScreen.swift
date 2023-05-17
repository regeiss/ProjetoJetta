//
//  VeiculoView.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 12/05/23.
//

import SwiftUI
import UIPilot
import RealmSwift

@available(iOS 16.0, *)
struct VeiculoScreen: View
{
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    @StateObject private var viewModel = VeiculoViewModel()
    @ObservedRealmObject var veiculo: Veiculo
    
    var body: some View
    {
        VStack
        {
            Form
            {
                Section
                {
                    TextField("nome", text: $veiculo.name)
                    // TextField("modelo", text: $veiculo.modelo)
                    // TextField("placa", text: $veiculo.placa)
                    // TextField("chassis", text: $veiculo.chassis)
                    // TextField("ano", text: $veiculo.ano)
                }
            }
            
        }.navigationTitle("Veículo")
            .navigationBarTitleDisplayMode(.automatic)
        
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
