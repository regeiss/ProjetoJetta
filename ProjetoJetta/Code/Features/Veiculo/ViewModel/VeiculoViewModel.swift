//
//  VeiculoViewModel.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 14/05/23.
//

import Foundation
import RealmSwift

class VeiculoViewModel: ObservableObject
{
    func saveObject(veiculo: Veiculo)
    {
        do
        {
            let realm = try Realm()
            try realm.write
            {
                realm.add(veiculo)
            }
            
            let carro = realm.objects(Veiculo.self)
            print(carro)
        }
        catch let error as NSError
        {
            print(error)
        }
    }
}
