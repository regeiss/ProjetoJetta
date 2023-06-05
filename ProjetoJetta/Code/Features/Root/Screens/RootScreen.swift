//
//  RootScreen.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 11/05/23.
//

import SwiftUI
import UIPilot
import RealmSwift

@available(iOS 16.0, *)
struct RootScreen: View
{
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
                Color("backGroundMain").edgesIgnoringSafeArea(.all)
                
                HomeScreen(showMenu: $showMenu)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: self.showMenu ? geometry.size.width / 2 : 0)
                    .disabled(self.showMenu ? true : false)
                    .transition(.move(edge: .leading))
                if self.showMenu
                {
                    SideMenuView(showMenu: $showMenu)
                        .frame(width: geometry.size.width / 2).edgesIgnoringSafeArea(.top)
                    .zIndex(0)                }
            }
            .gesture(drag)
            .modifier(DarkModeViewModifier())
        }
    }
}
