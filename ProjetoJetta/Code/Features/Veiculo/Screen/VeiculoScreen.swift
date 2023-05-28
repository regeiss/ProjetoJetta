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
struct VeiculoScreen: View
{
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    @StateObject private var viewModel = VeiculoViewModel()
    @ObservedObject var formInfo = VeiculoFormInfo()
    @State var isSaveDisabled: Bool = true
    
    let veiculo: Veiculo
    let isEdit: Bool = true
    
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
            }.scrollContentBackground(.hidden)
        }.onAppear
        {
            if isEdit
            {
                formInfo.nome = veiculo.name
                formInfo.marca = veiculo.marca ?? ""
                formInfo.modelo = veiculo.modelo ?? ""
                formInfo.placa = veiculo.placa ?? ""
                formInfo.chassis = veiculo.chassis ?? ""
                formInfo.ano = String(veiculo.ano) 
            }
        }
        .background(Color("backGroundMain"))
        .navigationTitle("Veículo")
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
                save()
                pilot.pop(animated: .random())
            }
                label: { Text("OK")}}
        }
    }
    
    func save()
    {
        let veiculo = Veiculo()
        
        veiculo.name = formInfo.nome
        veiculo.marca = formInfo.marca
        veiculo.modelo = formInfo.modelo
        veiculo.ano = Int(formInfo.ano) ?? 0
        veiculo.placa = formInfo.placa
        veiculo.chassis = formInfo.chassis
        veiculo.ativo = false
        veiculo.padrao = false
        viewModel.saveObject(veiculo: veiculo, isEdit: isEdit)
    }
}

class VeiculoFormInfo: ObservableObject
{
    @Published var nome: String = ""
    @Published var marca: String = ""
    @Published var modelo: String = ""
    @Published var placa: String = ""
    @Published var chassis: String = ""
    @Published var ano: String = ""
    
    let regexNumerico: String =  "[0-9[\\b]]+"
}
