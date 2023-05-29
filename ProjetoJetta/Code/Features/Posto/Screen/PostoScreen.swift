//
//  PostoView.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 23/05/23.
//

import SwiftUI
import UIPilot
import RealmSwift
import FormValidator

enum PostoFocusable: Hashable
{
    case nome
    case logo
}

class PostoFormInfo: ObservableObject
{
    @Published var manager = FormManager(validationType: .deferred)
    @FormField(validator: NonEmptyValidator(message: "Preencha este campo!"))
    
    var nome: String = ""
    lazy var nomeVazio = _nome.validation(manager: manager)
    var logo: String = ""
}

@available(iOS 16.0, *)
struct PostoScreen: View
{
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    @StateObject private var viewModel = PostoViewModel()
    @ObservedObject var form = PostoFormInfo()
    @FocusState private var postoInFocus: PostoFocusable?
    @State var isSaveDisabled: Bool = true
    
    var posto: Posto
    var isEdit: Bool
    
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
                        .focused($postoInFocus, equals: .nome)
                        .onAppear{ DispatchQueue.main.asyncAfter(deadline: .now() + 0.50) {self.postoInFocus = .nome}}
                    
                    TextField("logo", text: $form.logo)
                }
            }
            .scrollContentBackground(.hidden)
            .onReceive(form.manager.$allValid) { isValid in
                self.isSaveDisabled = !isValid}
        }.onAppear
        {
            if isEdit
            {
                form.nome = posto.nome
                form.logo = posto.logo
            }
        }
        .background(Color("backGroundMain"))
        .navigationTitle("Postos")
        .navigationBarTitleDisplayMode(.automatic)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading)
            { Button {
                save()
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
        let posto = Posto()
        
        posto.nome = form.nome
        posto.logo = form.logo

        viewModel.saveObject(posto: posto, isEdit: isEdit, nome: posto.nome, logo: posto.logo)
    }
}
