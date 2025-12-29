//
//  HomeViewModel.swift
//  Dashboard
//
//  Created by Adrien BONVALLET on 27/12/2025.
//

import Foundation
import SwiftUI
import Combine
import Supabase

@MainActor
class HomeViewModel: ObservableObject {
    @Published var services: [Service] = []
    @Published var isLoading: Bool = false
    
    private let dataService = DataService()
    
    func fetchUserServices(user: User) async {
        isLoading = true
        
        do {
            let userServices: [UserService] = try await SupabaseConfig.client
                .from("UserServices")
                .select("id, Services(*)")
                .eq("User", value: user.id.uuidString)
                .execute()
                .value
            
            self.services = userServices.map { $0.service }
            print("✅ Chargés: \(services)")
            
        } catch {
            print("❌ Erreur: \(error)")
        }
        isLoading = false
    }
    
}
