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
    func saveObject(veiculo: Veiculo, isEdit: Bool, nome: String, marca: String, modelo: String, ano: Int, placa: String, chassis: String)
    {
        do
        {
            let realm = try Realm()
            try realm.write
            {
                print("estado: ")
                print(isEdit)
                if isEdit
                {
                    let veiculoEditado = veiculo.thaw()
                    veiculoEditado?.nome = nome
                    veiculoEditado?.marca = marca
                    veiculoEditado?.modelo = modelo
                    veiculoEditado?.ano = Int(ano)
                    veiculoEditado?.placa = placa
                    veiculoEditado?.chassis = chassis
                    veiculoEditado?.ativo = false
                    veiculoEditado?.padrao = false
                    realm.add(veiculoEditado!, update: .modified)
                }
                else
                {
                    let veiculo = Veiculo()
                    veiculo.nome = nome
                    veiculo.marca = marca
                    veiculo.modelo = modelo
                    veiculo.ano = Int(ano)
                    veiculo.placa = placa
                    veiculo.chassis = chassis
                    veiculo.ativo = false
                    veiculo.padrao = false
                    realm.add(veiculo)
                }
            }
        }
        catch let error as NSError
        {
            print(error)
        }
    }
}
