//
//  AppRoute.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 11/05/23.
//

import Foundation

enum AppRoute: Equatable
{
    // TODO: ajustar os nomes de acordo com a funcao
    case root
    case login
    case browser
    case settings
    //
    case abastecimento
    case edicaoAbastecimento(abastecimento: Abastecimento)
    //
    case cadastros
    //
    case listaVeiculo
    case edicaoVeiculo(veiculo: Veiculo)
    case adicaoVeiculo(veiculo: Veiculo)
    
    //
    case listaPosto
    case adicaoPosto(posto: Posto)
    case edicaoPosto(posto: Posto)
    // 
    case testeView
}
