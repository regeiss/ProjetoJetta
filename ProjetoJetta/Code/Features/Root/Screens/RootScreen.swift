//
//  RootScreen.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 11/05/23.
//

import SwiftUI
import UIPilot

struct RootScreen: View
{
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    
    @State var showMenu: Bool
    
    var body: some View
    {
        let drag = DragGesture().onEnded
        {
            if $0.translation.width < -100
            {
                withAnimation { self.showMenu = false}
            }
        }
        
        GeometryReader
        { geometry in
            ZStack(alignment: .leading)
            {
                HomeScreen(showMenu: $showMenu)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: self.showMenu ? geometry.size.width / 2 : 0)
                    .disabled(self.showMenu ? true : false)
                    .transition(.move(edge: .leading))
                if self.showMenu
                {
                    SideMenuView(showMenu: $showMenu)
                        .frame(width: geometry.size.width / 2)
                }
            }.gesture(drag)
            
        }
    }
}
