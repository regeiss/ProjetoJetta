//
//  DetalheVeiculoView.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 14/05/23.
//

import SwiftUI
import RealmSwift

struct DetalheVeiculoView: View
{
    @ObservedRealmObject var veiculo: Veiculo
    var body: some View
    {
        HStack
        {
            Text(veiculo.name)
            Text(veiculo.placa ?? "")
        }
    }
}
