//
//  DetalheVeiculoView.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 14/05/23.
//

import SwiftUI
import RealmSwift
import UIPilot

struct DetalheListaVeiculoView: View
{
    @ObservedRealmObject var veiculo: Veiculo
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    
    var body: some View
    {
        HStack
        {
            Text(veiculo.name)
            Text(veiculo.placa ?? "")
            Text(veiculo.modelo ?? "")
        }.onTapGesture {
            pilot.push(.detalheVeiculo(veiculo))
        }
    }
}