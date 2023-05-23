//
//  PostoModel.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 22/05/23.
//

import Foundation
import RealmSwift

class Posto: Object, ObjectKeyIdentifiable
{
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var nome: String
    @Persisted var logo: Data

    convenience init(nome: String, logo: Data)
    {
        self.init()
        self.nome = nome
        self.logo = logo
    }
}
