//
//  RealmMigrator.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 16/05/23.
//

import Foundation
import RealmSwift

enum RealmMigrator
{
    static private func migrationBlock(migration: Migration, oldSchemaVersion: UInt64)
    {
        if oldSchemaVersion < 1
        {
            //            migration.enumerateObjects(ofType: Veiculo.className()) { _, newObject in
            //                newObject?["marca"] = ColorOptions.green
        }
    }
}
