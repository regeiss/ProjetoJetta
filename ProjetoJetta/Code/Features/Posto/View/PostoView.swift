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

@available(iOS 16.0, *)
struct PostoView: View
{
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    @StateObject private var viewModel = PostoViewModel()
    @ObservedObject var formInfo = PostoFormInfo()
    @State var isSaveDisabled: Bool = true
    
    let posto: Posto
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
                    TextField("logo", text: $formInfo.logo)
                }
            }
        }.onAppear
        {
            if isEdit
            {
                formInfo.nome = posto.nome
            }
        }
        .navigationTitle("Postos")
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
        let posto = Posto()
        
        posto.nome = formInfo.nome
        posto.logo = formInfo.logo

        viewModel.saveObject(posto: posto, isEdit: isEdit)
    }
}

class PostoFormInfo: ObservableObject
{
    @Published var nome: String = ""
    @Published var logo: String = ""
    
    let regexNumerico: String =  "[0-9[\\b]]+"
}
