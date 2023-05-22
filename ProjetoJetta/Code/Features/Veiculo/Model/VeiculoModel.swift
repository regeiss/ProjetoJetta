//
//  VeiculoModel.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 14/05/23.
//

import Foundation
import RealmSwift

class Veiculo: Object, ObjectKeyIdentifiable
{
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name = ""
    @Persisted var marca: String?
    @Persisted var modelo: String?
    @Persisted var ano: Int
    @Persisted var placa: String?
    @Persisted var chassis: String?
    @Persisted var ativo: Bool = false
    @Persisted var padrao: Bool = false
    @Persisted(originProperty: "veiculos") var doPerfil: LinkingObjects<Perfil>

    convenience init(name: String, marca: String, modelo: String, ano: Int, placa: String, chassis: String, ativo: Bool, padrao: Bool )
    {
        self.init()
        self.name = name
        self.marca = marca
        self.modelo = modelo
        self.ano = ano
        self.placa = placa
        self.chassis = chassis
        self.ativo = ativo
        self.padrao = padrao
    }
}
