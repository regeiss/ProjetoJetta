//
//  VeiculoView.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 12/05/23.
//

import SwiftUI
import UIPilot

@available(iOS 16.0, *)
struct VeiculoView: View
{
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    var body: some View
    {
        VStack
        {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }.navigationTitle("Abastecimento")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarRole(.editor)
//            .toolbar { ToolbarItem(placement: .navigationBarLeading)
//                { Button { showMenu = true}
//                label: { Image(systemName: "line.3.horizontal")}}
    }
}

