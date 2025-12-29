//
//  AppServices.swift
//  Dashboard
//
//  Created by Adrien BONVALLET on 27/12/2025.
//

import Foundation

struct AppService: Identifiable, Codable {
    let id: Int
    let name: String
    let img: String? // Peut être null ? Si oui, mettre String?
    let plans: PlanData? // Le fameux JSON

    // On mappe le JSON "plans" de ta capture
    struct PlanData: Codable {
        // Comme le JSON semble dynamique (clés "fr", "premium"),
        // c'est souvent le point complexe.
        // Pour l'instant, disons qu'on récupère la structure brute si elle change souvent,
        // sinon il faut définir "fr" comme une struct.
        let fr: [String: PlanDetail]?
    }
    
    struct PlanDetail: Codable {
        let name: String
        let price: Double? // À adapter selon ton JSON réel
    }
}
