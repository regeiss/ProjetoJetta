//
//  HomeScreen.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 11/05/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct HomeScreen: View
{
    @Binding var showMenu: Bool
    
    let collections = [
        Collections(id: 0, name: "Abastecimento", image: "gasStation", content: "."),
        Collections(id: 1, name: "Serviço", image: "service", content: "."),
        Collections(id: 2, name: "Relatórios", image: "report", content: "."),
        Collections(id: 3, name: "Alertas", image: "alertas", content: "."),
        Collections(id: 4, name: "Cadastros", image: "config", content: ".")
    ]
    
    let columns = [ GridItem(.flexible(minimum: 230, maximum: .infinity))]
    
    var body: some View
    {
        let drag = DragGesture().onEnded
        {
            if $0.translation.width < -100
            {
                withAnimation{ self.showMenu = false}
            }
        }
        
        VStack
        {
            ScrollView(.vertical)
            {
                LazyVGrid(columns: columns, alignment: .center, spacing: 5)
                {
                    DetalheMenuView(collection: collections[0])
                    DetalheMenuView(collection: collections[1])
                    DetalheMenuView(collection: collections[2])
                    DetalheMenuView(collection: collections[3])
                    DetalheMenuView(collection: collections[4])
                    
                }.padding([.leading, .trailing])
                    .gesture(drag)
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarRole(.navigationStack)
            .toolbar { ToolbarItem(placement: .navigationBarLeading)
                { Button { showMenu = true}
                label: { Image(systemName: "line.3.horizontal")}}
            }
        }
    }
}
