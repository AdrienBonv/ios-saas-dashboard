//
//  DashboardApp.swift
//  Dashboard
//
//  Created by Adrien BONVALLET on 13/12/2025.
//

import SwiftUI

@main
struct DashboardApp: App {
    @StateObject var authViewModel = AuthViewModel()
    var body: some Scene {
        WindowGroup {
            if authViewModel.isAuthenticated {
                // Si connecté -> On montre l'app
                HomeView() // Remplace par ta vue principale
                    .environmentObject(authViewModel) // Pour pouvoir se déconnecter depuis Home
            } else {
                // Si pas connecté -> On montre le login
                LoginView(viewModel: authViewModel)
            }
        }
    }
}
