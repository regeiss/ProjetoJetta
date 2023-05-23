//
//  ProjetoJettaApp.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 11/05/23.
//

import SwiftUI
import UIPilot
import RealmSwift

let app = App(id: "xxxxx")

class AppDelegate: NSObject, UIApplicationDelegate
{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
    {
            print("Migration Code Goes here")
            configure()
            return true
        }
    
    func configure()
    {
        var config = Realm.Configuration(
            schemaVersion: 1,
            deleteRealmIfMigrationNeeded: true
        )
        
        config.shouldCompactOnLaunch = { totalBytes, usedBytes in
            let oneHundredMB = 100 * 1024 * 1024
            return (totalBytes > oneHundredMB) && (Double(usedBytes) / Double(totalBytes)) < 0.5
        }
        Realm.Configuration.defaultConfiguration = config
    }
}

@main
@available(iOS 16.0, *)
struct ProjetoJettaApp: SwiftUI.App
{
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
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
                case .login: EmptyView()
                case .browser: EmptyView()
                case .settings: SettingsView()
                case .veiculo: ListaVeiculoScreen()
                case .edicaoVeiculo(let veiculo): VeiculoScreen(veiculo: veiculo)
                case .abastecimento: ListaAbastecimentoScreen()
                case .edicaoAbastecimento(let abastecimento): ListaAbastecimentoScreen()
                case .cadastros: CadastrosScreen()
                case .posto: ListaPostoScreen()
                case .testeView: TesteView()
                }
            }
        }
        .onChange(of: scenePhase)
        { phase in
            switch phase
            {
            case .active:
                print("active")
                print(Realm.Configuration.defaultConfiguration.fileURL as Any)
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
