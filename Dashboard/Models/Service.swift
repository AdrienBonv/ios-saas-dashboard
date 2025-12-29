//
//  Service.swift
//  Dashboard
//
//  Created by Adrien BONVALLET on 29/12/2025.
//

import Foundation

// MARK: - Plan
// Représente un seul plan (ex: Premium, Standard)
struct Plan: Codable {
    let name: String
    let price: String
}

// MARK: - LocalizedPlans
// Raccourci pour un dictionnaire de plans
typealias LocalizedPlans = [String: Plan]

// MARK: - Service
// Représente une ligne de ta table "Services"
struct Service: Codable, Identifiable {
    let id: Int
    let createdAt: Date
    let name: String
    let plans: [String: LocalizedPlans]?
    let img: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case name, plans, img
    }
}

// MARK: - Extensions
extension Service {
    func plans(for locale: String = "fr") -> [String: Plan] {
        return plans?[locale] ?? [:]
    }
    
    func plan(_ planKey: String, locale: String = "fr") -> Plan? {
        return plans?[locale]?[planKey]
    }
}
