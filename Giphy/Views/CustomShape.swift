//
//  CustomShape.swift
//  Giphy
//
//  Created by Nikhi on 24/09/20.
//

import SwiftUI


struct CustomShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight, .bottomLeft], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}
