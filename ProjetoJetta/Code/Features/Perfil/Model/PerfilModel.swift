//
//  PerfilModel.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 22/05/23.
//

import Foundation
import RealmSwift

class Perfil: Object, ObjectKeyIdentifiable
{
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var  nome: String
    @Persisted var  email: String
    @Persisted var  ativo: Bool
    @Persisted var  padrao: Bool
    // Relacionamento
    // @Persisted var doVeiculo: List<Veiculo>

    convenience init(nome: String, email: String, ativo: Bool, padrao: Bool)
    {
        self.init()
        self.nome = nome
        self.email = email
        self.ativo = ativo
        self.padrao = padrao
    }
}
