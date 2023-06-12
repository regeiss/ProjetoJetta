//
//  AppState.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 11/06/23.
//

import Foundation
import SwiftUI

class AppState
{
    var ultimaKM: Int32
    var carroAtivo: Veiculo?
    var perfilAtivo: Perfil?
    var postoPadrao: Posto?
    
    static var shared = AppState()
    
    private init()
    {
        ultimaKM = 1
    }
}
