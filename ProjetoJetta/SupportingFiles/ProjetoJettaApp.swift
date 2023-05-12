//
//  ProjetoJettaApp.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 11/05/23.
//

import SwiftUI
import UIPilot

@main
@available(iOS 16.0, *)
struct ProjetoJettaApp: App
{
    @Environment(\.scenePhase) private var scenePhase
    @StateObject var pilot = UIPilot(initial: AppRoute.root)
    
//    init()
//    {
//        NetworkMonitor.shared.startMonitoring()
//    }
    
    var body: some Scene
    {
        WindowGroup
        {
            UIPilotHost(pilot) { route in
                switch route
                {
                case .root: RootScreen(showMenu: false)
                case .login: EmptyView()
                case .browser: EmptyView()
                case .settings: SettingsView()
                case .abastecimento: VeiculoView()
                }
            }
        }
        .onChange(of: scenePhase)
        { phase in
            switch phase
            {
            case .active:
                print("active")
            case .inactive:
                print("inactive")
            case .background:
                print("background")
            @unknown default:
                fatalError()
            }
        }
    }
}
