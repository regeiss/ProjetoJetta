//
//  SettingsView.swift
//  ProjetoJetta
//
//  Created by Roberto Edgar Geiss on 12/05/23.
//

import SwiftUI
import UIPilot

@available(iOS 16.0, *)
struct SettingsView: View
{
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    @AppStorage("needsAppOnboarding") private var needsAppOnboarding: Bool = true
    @AppStorage("contextSet") private var contextSet: Bool = false
    @AppStorage("modoEscuro") private var modoEscuro: Bool = false
    @AppStorage("backup") private var backup: Bool = false
    @AppStorage("alertas") private var alertas: Bool = false
    
//    init()
//    {
//        UISegmentedControl.appearance().selectedSegmentTintColor = .orange
//    }
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            Form
            {
                Section
                {
                    Toggle(isOn: $backup)
                    {
                        Text("Backup")
                    }
                    Toggle(isOn: $alertas)
                    {
                        Text("Alertas")
                    }
                    Toggle(isOn: $modoEscuro)
                    {
                        Text("Modo escuro")
                    }
                }
                Section
                {
                    Button(action: {needsAppOnboarding = true},
                           label: {
                        Text("Reset Onboarding")
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .font(Font.title2.bold().lowercaseSmallCaps())
                    })
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            Spacer()
        }
    }
}
