//
//  GlobalAppearance.swift
//  Todoey
//
//  Created by Dovydas Dorofejevas on 26/11/2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import UIKit

struct GlobalAppearance {
    
    // Global template
    static func applyGlobalNavBarAppearance(backgroundColor: UIColor = .systemTeal) {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = backgroundColor
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        let navBar = UINavigationBar.appearance()
        navBar.standardAppearance = navBarAppearance
        navBar.scrollEdgeAppearance = navBarAppearance
        navBar.compactAppearance = navBarAppearance
        navBar.tintColor = .white
    }
    
    static func applyNavBarAppearance(to navBar: UINavigationBar, backgroundColor: UIColor = .systemTeal) {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = backgroundColor
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navBar.standardAppearance = navBarAppearance
        navBar.scrollEdgeAppearance = navBarAppearance
        navBar.compactAppearance = navBarAppearance
        navBar.tintColor = .white
    }
    
}

extension UIColor {
    var hexString: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        guard getRed(&r, green: &g, blue: &b, alpha: &a) else {
            return "#000000"
        }
        
        let ri = Int(r * 255)
        let gi = Int(g * 255)
        let bi = Int(b * 255)
        
        return String(format: "#%02X%02X%02X", ri, gi, bi)
    }
}
