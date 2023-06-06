//
//  PostoViewModel.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 24/05/23.
//

import Foundation
import RealmSwift
import Combine

class PostoViewModel: ObservableObject
{
//    @Published var postos = Posto
//    
//    init()
//    {
//        let realm = try? Realm()
//        if let postos = realm?.objects(Posto.self)
//        {
//            self.postos = postos.toArray(ofType: PostoDTO.self) as [PostoDTO]
//            print(self.postos)
//        }
//    }
    
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
                    realm.add(posto)
                }
            }
        }
        catch let error as NSError
        {
            print(error)
        }
    }
}
