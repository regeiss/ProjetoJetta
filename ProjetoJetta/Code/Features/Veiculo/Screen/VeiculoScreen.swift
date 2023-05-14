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
    var body: some View
    {
        VStack
        {
            Text("Veiculo")
            
        }.navigationTitle("Veículo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarRole(.navigationStack)
    }
}
