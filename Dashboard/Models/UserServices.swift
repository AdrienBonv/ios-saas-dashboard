//
//  UserServices.swift
//  Dashboard
//
//  Created by Adrien BONVALLET on 27/12/2025.
//

import Foundation

struct UserService: Identifiable, Codable {
    let id: Int
    let userId: UUID
    let service: Service

    enum CodingKeys: String, CodingKey {
        case id
        case userId = "User"     // Attention: Ta capture montre "User" avec majuscule
        case service = "Services" // Pour la jointure (voir plus bas)
    }
}
