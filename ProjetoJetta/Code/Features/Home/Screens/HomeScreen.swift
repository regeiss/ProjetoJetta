//
//  HomeScreen.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 11/05/23.
//

import SwiftUI
import RealmSwift

@available(iOS 16.0, *)
struct HomeScreen: View
{
    @Binding var showMenu: Bool
    @State private var isShowingSheet = false
    @ObservedResults(Veiculo.self, sortDescriptor: SortDescriptor(keyPath: "id", ascending: true)) var veiculos
    
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
        
        ZStack
        {
            Image("gasStation")
            ScrollView(.vertical)
            {
                Spacer()
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
            .navigationBarTitleDisplayMode(.automatic)
            .toolbarRole(.navigationStack)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading)
                { Button { showMenu = true}
                    label: { Image(systemName: "line.3.horizontal")}}
                
                ToolbarItem(placement: .navigationBarTrailing)
                { Button { isShowingSheet = true}
                    label: { Image(systemName: "car.2")}}
            }
        }
        .sheet(isPresented: $isShowingSheet, onDismiss: didDismiss)
        {
            List
            {
                Section(header: Text("Selecione um veículo"))
                {
                    ForEach(veiculos) { veiculo in
                        HStack
                        {
                            Text(veiculo.nome)
                            Text(veiculo.placa)
                            Text(String(veiculo.ano))
                        }
                    }

                }
            }.presentationDetents([.medium, .large])
            
            Button("Dispensar", action: { isShowingSheet.toggle() })
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
        }
    }
    
    func didDismiss()
    {
        // Handle the dismissing action.
    }
}
