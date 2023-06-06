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
    @Published var postos = [PostoDTO]()
    
    init()
    {
        let realm = try? Realm()
        // https://academy.realm.io/posts/isolating-your-data-layer/
//        if let postos = realm?.objects(Posto.self)
//        {
//            self.postos = convertToArray(results: postos)
//        }
    }
    
    private func convertToArray<R>(results: Results<R>) -> [R] where R: Object {
        var arrayOfResults: [R] = []
        for result in results {
            arrayOfResults.append(result)
        }
        return arrayOfResults
    }
    
    
    
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
