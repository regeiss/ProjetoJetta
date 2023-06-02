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
            Image(collection.image)
            .resizable()
            .allowsHitTesting(false)
            .aspectRatio(contentMode: .fill)
                .frame(height: collection.name == "Abastecimento" ? 150 : height)
                .cornerRadius(20)
                .clipped()
                .overlay(
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(20)
                        .opacity(0.2)
                        .frame(height: collection.name == "Abastecimento" ? 150 : height)
                    )
//            RoundedRectangle(cornerRadius: 10)
//                .fill(Material.ultraThinMaterial).opacity(0.4)
//                .frame(height: collection.name == "Abastecimento" ? 150 : height)

            
            if collection.name == "Abastecimento"
            {
                UltimoAbastecimentoView().offset(x: -10, y: -50)
            }
            
            Text(collection.name)
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .offset(x: 1.0, y: 10)
                .padding()
                .allowsHitTesting(false)
        }
    }
}
