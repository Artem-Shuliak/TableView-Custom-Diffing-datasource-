//
//  extensions.swift
//  InspoQuotes
//
//  Created by Artem Shuliak  on 3/15/21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import UIKit

extension UINavigationItem {
    
    func customAppearance() {
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemIndigo
        appearance.titleTextAttributes = [.foregroundColor : UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor : UIColor.white]
        
        standardAppearance = appearance
        scrollEdgeAppearance = appearance
        compactAppearance = appearance
    }
}
