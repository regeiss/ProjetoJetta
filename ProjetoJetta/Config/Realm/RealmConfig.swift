//
//  RealmConfig.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 15/05/23.
//

import Foundation
import RealmSwift

struct RealmConfig
{
    let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
}
