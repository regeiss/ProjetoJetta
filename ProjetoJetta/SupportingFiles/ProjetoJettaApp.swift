//
//  ProjetoJettaApp.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 11/05/23.
//

import SwiftUI
import UIPilot
import RealmSwift

let app = App(id: "tasktracker-xxxxx")

@main
@available(iOS 16.0, *)
struct ProjetoJettaApp: SwiftUI.App
{
    @Environment(\.scenePhase) private var scenePhase
    @StateObject var pilot = UIPilot(initial: AppRoute.root)
    
    var body: some Scene
    {
        WindowGroup
        {
            UIPilotHost(pilot) { route in
                switch route
                {
                case .root: RootScreen(showMenu: false)
                        .environment(\.realmConfiguration, RealmMigrator.configuration)
                case .login: EmptyView()
                case .browser: EmptyView()
                case .settings: SettingsView()
                case .abastecimento: ListaVeiculoScreen()
                case .detalheVeiculo: DetalheListaVeiculoView(veiculo: Veiculo())
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
