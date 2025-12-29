//
//  AuthService.swift
//  Dashboard
//
//  Created by Adrien BONVALLET on 27/12/2025.
//

import Foundation
import Supabase

struct AuthService {
    // Raccourci vers ton client
    private let client = SupabaseConfig.client

    // 1. Inscription
    func signUp(email: String, password: String) async throws {
        _ = try await client.auth.signUp(email: email, password: password)
    }

    // 2. Connexion
    func signIn(email: String, password: String) async throws {
        _ = try await client.auth.signIn(email: email, password: password)
    }

    // 3. Déconnexion
    func signOut() async throws {
        try await client.auth.signOut()
    }
    
    // 4. Vérifier si une session existe déjà (au lancement de l'app)
    func getCurrentSession() async throws -> Session? {
        return try await client.auth.session
    }
        
    func createProfile(id: UUID, name: String, email: String) async throws {
        let newProfile = UserProfile(id: id, name: name, email: email)
        
        try await SupabaseConfig.client.from("profiles").insert(newProfile).execute()
    }
}
