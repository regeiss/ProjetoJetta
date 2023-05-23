//
//  TesteView.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 23/05/23.
//

import SwiftUI

struct TesteView: View {
    var body: some View {
        ZStack
        {
            Color("backGroundMain").edgesIgnoringSafeArea(.all)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        
    }
}

struct TesteView_Previews: PreviewProvider {
    static var previews: some View {
        TesteView()
    }
}
