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
    func saveObject(posto: Posto, isEdit: Bool, nome: String, logo: String)
    {
        do
        {
            let realm = try Realm()
            try realm.write
            {
                if isEdit
                {
                    let postoEditado = posto.thaw()
                    postoEditado?.nome = nome
                    postoEditado?.logo = logo
                    realm.add(postoEditado!, update: .modified)
                }
                else
                {
                    let posto = Posto()
                    posto.nome = nome
                    posto.logo = logo
                    realm.add(posto, update: .modified)
                }
            }
        }
        catch let error as NSError
        {
            print(error)
        }
    }
}
