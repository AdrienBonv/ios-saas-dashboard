//
//  AuthViewModel.swift
//  Dashboard
//
//  Created by Adrien BONVALLET on 27/12/2025.
//

import Foundation
import SwiftUI
import Combine
import Supabase

@MainActor
class AuthViewModel: ObservableObject {
    
    // --- État de l'interface ---
    @Published var email = ""
    @Published var name = ""
    @Published var password = ""
    @Published var isAuthenticated = false // Le "switch" principal pour ton App
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var currentUser: User?
    
    private let service = AuthService()
    
    // À l'initialisation, on vérifie si l'utilisateur est déjà là
    init() {
        Task {
            await checkSession()
        }
    }
    
    func checkSession() async {
        do {
            if let _ = try await service.getCurrentSession() {
                let session = try await SupabaseConfig.client.auth.session
                self.currentUser = session.user
                self.isAuthenticated = true
            }
        } catch {
            // Pas grave s'il n'y a pas de session, on reste déconnecté
            self.isAuthenticated = false
        }
    }
    
    func login() {
        guard !email.isEmpty, !password.isEmpty else { return }
        
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                try await service.signIn(email: email, password: password)
                self.isAuthenticated = true
            } catch {
                self.errorMessage = "Erreur de connexion : \(error.localizedDescription)"
            }
            self.isLoading = false
        }
    }
    
    func register() {
        guard !email.isEmpty, !password.isEmpty, !name.isEmpty else { return }
        
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                try await service.signUp(email: email, password: password)
                
                self.isAuthenticated = true
            } catch {
                self.errorMessage = "Erreur d'inscription : \(error.localizedDescription)"
            }
            self.isLoading = false
        }
    }
    
    func logout() {
        Task {
            try? await service.signOut()
            self.isAuthenticated = false
            self.email = ""
            self.password = ""
        }
    }
}
