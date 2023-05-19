//
//  VeiculoView.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 12/05/23.
//

import SwiftUI
import UIPilot
import RealmSwift
import FormValidator

@available(iOS 16.0, *)
struct EdicaoVeiculoScreen: View
{
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    @StateObject private var viewModel = VeiculoViewModel()
    @ObservedRealmObject var veiculo: Veiculo
    @ObservedObject var formInfo = CarroFormInfo()
    
    var body: some View
    {
        VStack
        {
            Form
            {
                Section
                {
                    TextField("nome", text: $formInfo.nome)
                    TextField("marca", text: $formInfo.marca)
                    TextField("modelo", text: $formInfo.modelo)
                    TextField("placa", text: $formInfo.placa)
                    TextField("chassis", text: $formInfo.chassis)
                    TextField("ano", text: $formInfo.ano)
                }
            }
        }.navigationTitle("Veículo")
        .navigationBarTitleDisplayMode(.automatic)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading)
            { Button {
                pilot.pop(animated: .random())
            }
                label: { Text("Cancelar")}}
            ToolbarItem(placement: .navigationBarTrailing)
            { Button {
                pilot.push(.edicaoVeiculo(Veiculo()))
            }
                label: { Text("OK")}}
        }
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

class CarroFormInfo: ObservableObject
{
    @Published var nome: String = ""
    @Published var marca: String = ""
    @Published var modelo: String = ""
    @Published var placa: String = ""
    @Published var chassis: String = ""
    @Published var ano: String = ""
    
    let regexNumerico: String =  "[0-9[\\b]]+"
}
