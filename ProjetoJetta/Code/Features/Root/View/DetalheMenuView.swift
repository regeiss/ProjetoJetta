//
//  DetalheMenuView.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 11/05/23.
//

import SwiftUI
import UIPilot

struct DetalheMenuView: View
{
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    var collection: Collections
    let height: CGFloat = 110
    
    var body: some View
    {
        ZStack(alignment: .bottomTrailing)
        {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray)
                .frame(height: collection.name == "Abastecimento" ? 150 : height)
                .opacity(0.4)
                .onTapGesture { pilot.push(.abastecimento)}
            
            Text(collection.name)
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(.orange)
                .offset(x: 1.0, y: 10)
                .padding()
                // .onTapGesture { screenRouter(indice: collection.id)}
            
        }.frame(minWidth: 230, maxWidth: .infinity, minHeight: height, maxHeight: 150)
    }
}
