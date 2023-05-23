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
    @StateObject private var viewModel = VeiculoViewModel()
    @ObservedObject var formInfo = CarroFormInfo()
    @State var isSaveDisabled: Bool = true
    
    let posto: Posto
    let isEdit: Bool = true
    
    var body: some View
    {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


