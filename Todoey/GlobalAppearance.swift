//
//  GlobalAppearance.swift
//  Todoey
//
//  Created by Dovydas Dorofejevas on 26/11/2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import UIKit

struct GlobalAppearance {
    
    static func navBarAppearance() {
        // Configuration
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .systemTeal
        
        // Apply to all nav bars via the appearance proxy
        let navBar = UINavigationBar.appearance()
        navBar.standardAppearance = navBarAppearance
        navBar.compactAppearance = navBarAppearance
        navBar.scrollEdgeAppearance = navBarAppearance
    }
    
}
