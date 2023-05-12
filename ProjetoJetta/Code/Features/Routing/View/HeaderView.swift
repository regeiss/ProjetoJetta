//
//  HeaderView.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 12/05/23.
//

import SwiftUI
import UIPilot

@available(iOS 16.0, *)
struct HeaderView: View
{
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    var nomeView: String
    var nomeMenu: String
    
    var body: some View
    {
        VStack
        {
            HStack
            {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.blue)
                    .imageScale(.large)
                    .padding([.leading])
                    .onTapGesture {
                        pilot.pop(animated: .random())
                    }
                
                Text(nomeMenu).foregroundColor(.blue).font(.system(.title3, design: .rounded))
                Spacer()
                Image(systemName: "house")
                    .foregroundColor(.blue)
                    .imageScale(.large)
                    .padding([.trailing])
                    .onTapGesture {
                        pilot.push(.root)
                    }
            }
            
            HStack
            {
                Text(nomeView).font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                    .padding([.leading])
                Spacer()
            }.padding([.top])
        }
    }
}
