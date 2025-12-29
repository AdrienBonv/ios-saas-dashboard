//
//  SelectServiceView.swift
//  Dashboard
//
//  Created by Adrien BONVALLET on 29/12/2025.
//

import Foundation
import SwiftUI

struct SelectServiceView: View {
    
    
    @StateObject private var viewModel = SelectServiceViewModel()

    var body: some View {
        List(viewModel.services) { service in
            Text(service.name)
        }
        .task { await viewModel.fetchServices() }
    }
        
}

#Preview {
    SelectServiceView()
}
