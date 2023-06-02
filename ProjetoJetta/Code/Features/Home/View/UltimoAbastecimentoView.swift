//
//  UltimoAbastecimentoView.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 01/06/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct UltimoAbastecimentoView: View
{
    var body: some View
    {
        HStack
        {
            StyledGauge(current: 20)
            
            VStack(alignment: .leading)
            {
                HStack
                {
                    Text("Última vez: ")
                    // Text((viewModel.abastecimentosLista.first?.data ?? Date()).formatted(date: .numeric, time: .omitted))
                    Spacer()
                    // Text(String(format: "%.2f", viewModel.abastecimentosLista.first?.media ?? 0))
                }
                
                HStack
                {
                    Text("Odômetro: ")
                    // Text(String(viewModel.abastecimentosLista.first?.km ?? 0).toQuilometrosFormat())
                }
                
                HStack
                {
                    Text("Volume: ")
                    // Text(String(format: "%.2f", viewModel.abastecimentosLista.first?.litros ?? 0))
                }
                
                HStack
                {
                    Text("Valor: ")
                    // Text(String(viewModel.abastecimentosLista.first?.valorTotal ?? 0).toCurrencyFormat())
                }
            }
        }.padding()
            .font(.caption)
            .foregroundColor(.black)
            .background(.ultraThinMaterial)
            .cornerRadius(14)
            .frame(width: 320, height: 15, alignment: .bottomLeading)
            .allowsHitTesting(false)
    }
}

@available(iOS 16.0, *)
struct StyledGauge: View
{
    @State var current: Double
    @State private var minValue = 0.0
    @State private var maxValue = 170.0
    let gradient = Gradient(colors: [.green, .yellow, .red])
    
    var body: some View {
        Gauge(value: current, in: minValue...maxValue) {
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
        } currentValueLabel: {
            Text(String(format: "%.2f", current))
                .foregroundColor(Color.green)
        } minimumValueLabel: {
            Text("\(Int(minValue))")
                .foregroundColor(Color.green)
        } maximumValueLabel: {
            Text("\(Int(maxValue))")
                .foregroundColor(Color.red)
        }
        .gaugeStyle(.accessoryCircularCapacity)
        .tint(gradient)
    }
}
