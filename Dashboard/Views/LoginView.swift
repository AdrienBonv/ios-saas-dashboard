//
//  LoginView.swift
//  Dashboard
//
//  Created by Adrien BONVALLET on 27/12/2025.
//

import SwiftUI

struct LoginView: View {
    // On récupère le ViewModel via l'environnement (voir étape 4 plus bas)
    // OU on l'injecte via @StateObject si c'est la vue racine.
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Bienvenue")
                .font(.largeTitle)
                .bold()
            
            
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
            
            SecureField("Mot de passe", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)
            
            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            Button(action: {
                viewModel.login()
            }) {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Text("Se connecter")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            Button("Pas de compte ? S'inscrire") {
                viewModel.register()
            }
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    // On crée une instance "vide" juste pour voir à quoi ressemble l'écran
    LoginView(viewModel: AuthViewModel())
}
