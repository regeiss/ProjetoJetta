//
//  RealmUserMode.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 16/05/23.
//

import Foundation
import RealmSwift

class User: Object, ObjectKeyIdentifiable
{
    @Persisted(primaryKey: true) dynamic var id: String = UUID().uuidString
    @Persisted var partition: String = ""
    @Persisted var name: String = ""
    // @Persisted var memberOf = RealmSwift.List<Project>()

    override static func primaryKey() -> String?
    {
        return "_id"
    }
}
