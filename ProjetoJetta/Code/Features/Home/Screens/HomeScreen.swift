//
//  HomeScreen.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 11/05/23.
//

import SwiftUI
import UIPilot
import RealmSwift

@available(iOS 16.0, *)
struct HomeScreen: View
{
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    @Binding var showMenu: Bool
    @State private var isShowingSheet = false
    @ObservedResults(Veiculo.self, sortDescriptor: SortDescriptor(keyPath: "id", ascending: true)) var veiculos
    
    let collections = [
        Collections(id: 0, name: "Abastecimento", image: "abastecimento", content: "."),
        Collections(id: 1, name: "Serviço", image: "servicos", content: "."),
        Collections(id: 2, name: "Relatórios", image: "relatorios", content: "."),
        Collections(id: 3, name: "Alertas", image: "alertas", content: "."),
        Collections(id: 4, name: "Cadastros", image: "cadastros", content: ".")
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
            ScrollView(.vertical)
            {
                Spacer()
                LazyVGrid(columns: columns, alignment: .center, spacing: 5)
                {
                    DetalheMenuView(collection: collections[0])
                        .onTapGesture { pilot.push(.abastecimento)}
                    DetalheMenuView(collection: collections[1])
                        .onTapGesture { pilot.push(.listaServico)}
                    DetalheMenuView(collection: collections[2])
                        .onTapGesture { pilot.push(.listaRelatorio)}
                    DetalheMenuView(collection: collections[3])
                        .onTapGesture { pilot.push(.listaAlerta)}
                    DetalheMenuView(collection: collections[4])
                        .onTapGesture { pilot.push(.cadastros)}
                }
                .padding([.leading, .trailing])
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
            }
            .presentationDetents([.medium, .large])
            
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
