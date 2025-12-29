//
//  Service.swift
//  Dashboard
//
//  Created by Adrien BONVALLET on 29/12/2025.
//

import Foundation
import SwiftUI

struct ServiceCard: View {
    let service: Service
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Nom du service
            Text(service.name)
                .font(.title2.bold())
            
            // Plans
            if let frPlans = service.plans?["fr"] {
                ForEach(Array(frPlans.keys.sorted()), id: \.self) { key in
                    if let plan = frPlans[key] {
                        HStack {
                            Text(plan.name)
                            Spacer()
                            Text("\(plan.price) €")
                                .fontWeight(.semibold)
                        }
                        .font(.subheadline)
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
    }
}
