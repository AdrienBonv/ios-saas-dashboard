//
//  UserProfile.swift
//  Dashboard
//
//  Created by Adrien BONVALLET on 27/12/2025.
//

import Foundation

struct UserProfile: Identifiable, Codable {
    let id: UUID
    let name: String?
    let email: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        // created_at est géré auto par le décodeur si tu configures la date,
        // sinon ajoute: case createdAt = "created_at"
    }
}
