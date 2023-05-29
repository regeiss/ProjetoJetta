//
//  VeiculoScreen.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 12/05/23.
//

import SwiftUI
import UIPilot
import RealmSwift
import FormValidator

enum VeiculoFocusable: Hashable
{
    case nome
    case logo
}

class VeiculoFormInfo: ObservableObject
{
    @Published var manager = FormManager(validationType: .deferred)
    @FormField(validator: NonEmptyValidator(message: "Preencha este campo!"))
    
    var nome: String = ""
    lazy var nomeVazio = _nome.validation(manager: manager)
    var marca: String = ""
    var modelo: String = ""
    var placa: String = ""
    var chassis: String = ""
    var ano: String = ""
}

@available(iOS 16.0, *)
struct VeiculoScreen: View
{
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    @StateObject private var viewModel = VeiculoViewModel()
    @ObservedObject var form = VeiculoFormInfo()
    @FocusState private var veiculoInFocus: VeiculoFocusable?
    @State var isSaveDisabled: Bool = true
    
    let veiculo: Veiculo
    let isEdit: Bool
    
    var body: some View
    {
        VStack
        {
            Form
            {
                Section
                {
                    TextField("nome", text: $form.nome)
                        .validation(form.nomeVazio)
                        .focused($veiculoInFocus, equals: .nome)
                        .onAppear{ DispatchQueue.main.asyncAfter(deadline: .now() + 0.50) {self.veiculoInFocus = .nome}}
                    TextField("marca", text: $form.marca)
                    TextField("modelo", text: $form.modelo)
                    TextField("placa", text: $form.placa)
                    TextField("chassis", text: $form.chassis)
                    TextField("ano", text: $form.ano)
                }
            }
            .onReceive(form.manager.$allValid) { isValid in
                self.isSaveDisabled = !isValid}
            .scrollContentBackground(.hidden)
        }.onAppear
        {
            if isEdit
            {
                form.nome = veiculo.nome
                form.marca = veiculo.marca
                form.modelo = veiculo.modelo
                form.placa = veiculo.placa
                form.chassis = veiculo.chassis
                form.ano = String(veiculo.ano) 
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
            label: { Text("OK").disabled(isSaveDisabled)}
            }
        }
    }
    
    func save()
    {
        let veiculo = Veiculo()
        
        veiculo.nome = form.nome
        veiculo.marca = form.marca
        veiculo.modelo = form.modelo
        veiculo.ano = Int(form.ano) ?? 0
        veiculo.placa = form.placa
        veiculo.chassis = form.chassis
        veiculo.ativo = false
        veiculo.padrao = false
        viewModel.saveObject(veiculo: veiculo, isEdit: isEdit, nome: veiculo.nome, marca: veiculo.marca, modelo: veiculo.modelo, ano: veiculo.ano,
                             placa: veiculo.placa, chassis: veiculo.chassis)
    }
}
