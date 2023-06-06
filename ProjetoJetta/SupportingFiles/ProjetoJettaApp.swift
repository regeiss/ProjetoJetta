//
//  ProjetoJettaApp.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 11/05/23.
//

import SwiftUI
import UIPilot
import RealmSwift

let realmApp = RealmSwift.App(id: "write-here-your-own-realm-app-id")

class AppDelegate: NSObject, UIApplicationDelegate
{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
    {
            configureRealm()
            return true
        }
    
    func configureRealm()
    {
        let config = Realm.Configuration(
                 // Set the new schema version. This must be greater than the previously used
                 // version (if you've never set a schema version before, the version is 0).
                 schemaVersion: 1, deleteRealmIfMigrationNeeded: true
//                 migrationBlock: { migration, oldSchemaVersion in
//                     // We haven’t migrated anything yet, so oldSchemaVersion == 0
//                     if oldSchemaVersion < 1 {
//                         // Nothing to do!
//                         // Realm will automatically detect new properties and removed properties
//                         // And will update the schema on disk automatically
//                     }
//                 }
        )
             
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
            ZStack
            {
                Color("backGroundMain").edgesIgnoringSafeArea(.all)
                UIPilotHost(pilot) { route in
                    switch route
                    {
                    case .root: RootScreen(showMenu: false)
                    case .login: LoginScreen()
                    case .browser: EmptyView()
                    case .settings: SettingsView()
                    case .listaVeiculo: VeiculoListaScreen()
                    case .adicaoVeiculo(let veiculo): VeiculoScreen(veiculo: veiculo, isEdit: false)
                    case .edicaoVeiculo(let veiculo): VeiculoScreen(veiculo: veiculo, isEdit: true)
                    case .abastecimento: AbastecimentoListaScreen()
                    case .edicaoAbastecimento(let abastecimento): AbastecimentoScreen(abastecimento: abastecimento, isEdit: true)
                    case .cadastros: CadastrosScreen()
                    case .listaPosto: PostoListaScreen()
                    case .adicaoPosto: PostoScreen(posto: Posto(), isEdit: false)
                    case .edicaoPosto(let posto): PostoScreen(posto: posto, isEdit: true)
                    case .testeView: TesteView()
                    case .listaServico: ServicoListaScreen()
                    case .listaRelatorio: RelatorioListaScreen()
                    case .listaAlerta: AlertaListaScreen()
                        
                    }
                }}
        }
        .onChange(of: scenePhase)
        { phase in
            switch phase
            {
            case .active:
                print("active")
                print("DEBUG: Realm Path: \(Realm.Configuration.defaultConfiguration.fileURL)")
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
