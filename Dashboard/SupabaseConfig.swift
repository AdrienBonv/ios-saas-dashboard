//
//  SupabaseConfig.swift
//  Dashboard
//
//  Created by Adrien BONVALLET on 27/12/2025.
//

import Foundation

import Supabase

enum SupabaseConfig {
    // Dans un vrai projet, ne mets pas les clés en dur ici, utilise un fichier Secrets ou Info.plist
    static let supabaseURL = URL(string: "https://ehislrmrqikibhucfanq.supabase.co")!
    static let supabaseKey = "sb_publishable_D5d94e3ZUiQfsffz9E8lAA_dMykxi6T"
    
    // L'instance unique que tout le monde va utiliser
    static let client = SupabaseClient(supabaseURL: supabaseURL, supabaseKey: supabaseKey)
}
