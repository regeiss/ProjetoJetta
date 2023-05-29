//
//  DetalheMenuView.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 11/05/23.
//

import SwiftUI
import UIPilot

@available(iOS 16.0, *)
struct DetalheMenuView: View
{
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    var collection: Collections
    let height: CGFloat = 130
    
    var body: some View
    {
        ZStack(alignment: .bottomTrailing)
        {
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(gradient: Gradient(colors: [.mint, .blue]), startPoint: .top, endPoint: .bottom))
                .frame(height: collection.name == "Abastecimento" ? 150 : height)
                .onTapGesture {
                    if collection.name == "Abastecimento"
                    {
                        pilot.push(.abastecimento)
                    }
                    
                    if collection.name == "Cadastros"
                    {
                        pilot.push(.cadastros)
                    }
                }
            
            Text(collection.name)
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .offset(x: 1.0, y: 10)
                .padding()
                .allowsHitTesting(false)
        }.frame(minWidth: 230, maxWidth: .infinity, minHeight: height, maxHeight: 150)
    }
}
