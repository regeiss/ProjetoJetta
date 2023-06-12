//
//  ProjetoJettaApp.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 11/05/23.
//

import SwiftUI
import UIPilot
import CoreData

@main
@available(iOS 16.0, *)
struct ProjetoJettaApp: SwiftUI.App
{
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.managedObjectContext) private var moc: NSManagedObjectContext
    
    @StateObject var pilot = UIPilot(initial: AppRoute.root)
    static let persistenceController = PersistenceController.shared
    
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
                    case .adicaoVeiculo: VeiculoScreen()
                    case .edicaoVeiculo: VeiculoScreen()
                    case .abastecimento: AbastecimentoListaScreen()
                    case .edicaoAbastecimento(let abastecimento): AbastecimentoScreen(abastecimento: abastecimento, isEdit: true)
                    case .cadastros: CadastrosScreen()
                    case .listaPosto: PostoListaScreen()
                    case .adicaoPosto: PostoScreen(posto: Posto(), isEdit: false)
                    case .edicaoPosto: PostoScreen(posto: Posto(), isEdit: true)
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
