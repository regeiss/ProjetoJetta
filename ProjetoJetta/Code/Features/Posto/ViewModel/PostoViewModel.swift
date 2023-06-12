//
//  PostoViewModel.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 24/05/23.
//

import Foundation
import CoreData
import Combine

class PostoViewModel: ObservableObject
{
    @Published var postosLista: [Posto] = []

    private var bag: AnyCancellable?

    init(postoPublisher: AnyPublisher<[Posto], Never> = PostoPublisher.shared.postoCVS.eraseToAnyPublisher())
    {
        bag = postoPublisher.sink { [unowned self] postosLista in
            self.postosLista = postosLista
        }
    }

    func add(posto: NovoPosto)
    {
        PostoPublisher.shared.add(posto: posto)
    }

    func update(posto: Posto)
    {
        PostoPublisher.shared.update(posto: posto)
    }
    
    func delete(posto: Posto)
    {
        PostoPublisher.shared.delete(posto: posto)
    }
    
    func inserePadrao()
    {
        PostoPublisher.shared.inserePadrao()
    }
    
    func selecionarPostoPadrao()
    {
        PostoPublisher.shared.selecionarPostoPadrao()
    }
}
