//
//  DataService.swift
//  Dashboard
//
//  Created by Adrien BONVALLET on 27/12/2025.
//

import Supabase
import Foundation

struct DataService {
    let client = SupabaseConfig.client // Ton singleton créé avant

    // 1. Récupérer tout le catalogue (Table Services)
    func fetchCatalog() async throws -> [AppService] {
        let response: [AppService] = try await client
            .from("Services") // Attention à la majuscule
            .select()
            .execute()
            .value
        
        return response
    }

    // 2. Récupérer les abonnements de l'utilisateur (Table UserServices + Jointure vers Services)
    func fetchUserSubscriptions(userId: UUID) async throws -> [UserService] {
        let response: [UserService] = try await client
            .from("UserServices") // Attention à la majuscule
            .select("""
                *,
                Services (*) 
            """) // Cette syntaxe dit: "Prends tout de UserServices, ET va chercher les détails dans la table Services liée"
            .eq("User", value: userId) // Filtre sur l'ID user
            .execute()
            .value
            
        return response
    }
}
