//
//  AppRoute.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 11/05/23.
//

import Foundation

enum AppRoute: Equatable
{
    case root
    case login
    case browser
    case settings
    case abastecimento
    case cadastros
    case veiculo
    case edicaoVeiculo(veiculo: Veiculo)
    case edicaoAbastecimento(abastecimento: Abastecimento)
    case posto
    case testeView
}
