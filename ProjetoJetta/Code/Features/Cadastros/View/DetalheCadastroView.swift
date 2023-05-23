//
//  DetalheCadastroView.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 22/05/23.
//

import SwiftUI

struct DetalheCadastroView: View
{
    var titulo: String
    
    var body: some View
    {
        ZStack(alignment: .trailing)
        {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray)
                .frame(height: 100)
            
            Text(titulo)
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
                .padding()
        }
    }
}
