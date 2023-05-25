//
//  PostoViewModel.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 24/05/23.
//

import Foundation
import RealmSwift

class PostoViewModel: ObservableObject
{
    func saveObject(posto: Posto, isEdit: Bool)
    {
        do
        {
            let realm = try Realm()
            try realm.write
            {
                realm.add(posto)
            }
        }
        catch let error as NSError
        {
            print(error)
        }
    }
}
