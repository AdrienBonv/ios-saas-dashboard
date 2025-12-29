//
//  ContentView.swift
//  Dashboard
//
//  Created by Adrien BONVALLET on 13/12/2025.
//

import SwiftUI
internal import Auth

struct HomeView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @StateObject private var viewModel = HomeViewModel()

//    var name: String = "Adrien"
    var amount: String = "100$"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    if let user = authViewModel.currentUser {
                        Text("Bonjour \(user.email ?? "Utilisateur")")
                    }
                    Text("Total Mensuel:")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(amount)
                        .font(.system(size: 34, weight: .bold))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                ZStack {
                    ForEach(Array(viewModel.services.enumerated()), id: \.element.id) { index, service in
                        ServiceCard(service: service)
                            .offset(y: CGFloat(index) * 80)
                            .scaleEffect(1.0 - CGFloat(index) * 0.05) // Réduit légèrement chaque carte
                            .zIndex(Double(viewModel.services.count - index))
                    }
                }
            }
        }
        .task {
            await loadData()
        }
    }
    
    private func loadData() async {
        await authViewModel.checkSession()
        
        guard let user = authViewModel.currentUser else { return }
        
        await viewModel.fetchUserServices(user: user)
    }
}

#Preview {
    HomeView()
        .environmentObject(AuthViewModel())
}
