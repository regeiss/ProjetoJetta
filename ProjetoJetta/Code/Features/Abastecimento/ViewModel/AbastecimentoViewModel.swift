//
//  AbastecimentoViewModel.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 21/05/23.
//

import Foundation
import RealmSwift

class AbastecimentoViewModel: ObservableObject
{
    func saveObject(abastecimento: Abastecimento)
    {
        do
        {
            let realm = try Realm()
            try realm.write
            {
                realm.add(abastecimento)
            }
        }
        catch let error as NSError
        {
            print(error)
        }
    }
}
