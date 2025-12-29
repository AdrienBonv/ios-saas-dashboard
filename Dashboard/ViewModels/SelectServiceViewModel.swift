//
//  SelectServiceViewModel.swift
//  Dashboard
//
//  Created by Adrien BONVALLET on 29/12/2025.
//

import Foundation
import SwiftUI
import Combine
import Supabase

@MainActor
class SelectServiceViewModel: ObservableObject {
    @Published var services: [Service] = []
    @Published var isLoading: Bool = false
    
    private let dataService = DataService()

    func fetchServices() async {
        isLoading = true
        
        do {
            let services: [Service] = try await SupabaseConfig.client
                .from("Services")
                .select()
                .execute()
                .value
            
            self.services = services
            
        } catch {
            print("❌ Erreur: \(error)")
        }
        isLoading = false
    }
    
}
