//
//  AbastecimentoModel.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 21/05/23.
//

import Foundation
import RealmSwift

class Abastecimento: Object, ObjectKeyIdentifiable
{
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var km: Int32
    @Persisted var data: Date
    @Persisted var litros: Double
    @Persisted var valorLitro: Double
    @Persisted var valorTotal: Double 
    @Persisted var completo: Bool
    @Persisted var media: Double
//    let doPosto: Posto
//    let doCarro: Carro
    convenience init(km: Int32, data: Date, valorLitro: Double, valorTotal: Double, completo: Bool, media: Double)
    {
        self.init()
        self.km = km
        self.data = data
        self.valorLitro = valorLitro
        self.valorTotal = valorTotal
        self.completo = completo
        self.media = media
    }
}
