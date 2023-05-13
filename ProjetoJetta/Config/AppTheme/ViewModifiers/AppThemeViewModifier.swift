//
//  AppThemeViewModifier.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 13/05/23.
//

import Foundation
import SwiftUI

class AppThemeViewModel: ObservableObject
{
    @AppStorage("modoEscuro") var isDarkMode: Bool = true
}

struct DarkModeViewModifier: ViewModifier
{
    @ObservedObject var appThemeViewModel: AppThemeViewModel = AppThemeViewModel()
    
    public func body(content: Content) -> some View
    {
        content
            .preferredColorScheme(appThemeViewModel.isDarkMode ? .dark : appThemeViewModel.isDarkMode == false ? .light : nil)
            
    }
}
