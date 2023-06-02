//
//  DetalheCadastroView.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 22/05/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct CadastroDetalheView: View
{
    let height: CGFloat = 150
    var titulo: String
    
    var body: some View
    {
        ZStack(alignment: .bottomTrailing)
        {
            Image("gasStation")
            .resizable()
            .allowsHitTesting(false)
            .aspectRatio(contentMode: .fill)
                .frame(height: height)
                .cornerRadius(20)
                .clipped()
                .overlay(
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(20)
                        .opacity(0.2)
                        .frame(height: height)
                    )
        
            Text(titulo)
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .offset(x: 1.0, y: 10)
                .padding()
                .allowsHitTesting(false)
        }
    }
}
