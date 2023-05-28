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
    var titulo: String
    
    var body: some View
    {
        ZStack(alignment: .trailing)
        {
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .frame(height: 130)
            
            Text(titulo)
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
                .padding()
        }
    }
}
