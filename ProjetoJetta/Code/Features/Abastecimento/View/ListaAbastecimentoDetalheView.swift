//
//  ListaAbastecimentoDetalheView.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 21/05/23.
//

import SwiftUI
import RealmSwift
import UIPilot

@available(iOS 16.0, *)
struct ListaAbastecimentoDetalheView: View
{
    @ObservedRealmObject var abastecimento: Abastecimento
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    
    var body: some View
    {
        HStack
        {
            Text((abastecimento.data).formatted(date: .numeric, time: .omitted))
            Text(String(format: "%.2f", abastecimento.valorLitro).toCurrencyFormat())
            Text(String(format: "%.2f", abastecimento.valorTotal).toCurrencyFormat())
        }.onTapGesture {
            pilot.push(.edicaoAbastecimento(abastecimento: abastecimento))
        }
    }
}
