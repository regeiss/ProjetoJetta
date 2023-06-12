//
//  PostoModel.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 22/05/23.
//
import Foundation

struct NovoPosto: Identifiable
{
    let id: UUID
    let nome: String
    let bandeira: String
    let padrao: Bool
}
