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
        static var configuration: Realm.Configuration
        {
            Realm.Configuration(schemaVersion: 1, deleteRealmIfMigrationNeeded: true)
        }
}
