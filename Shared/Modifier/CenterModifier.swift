//
//  CenterModifier.swift
//  Africa
//
//  Created by Ezra Bathini on 5/01/22.
//


import SwiftUI


struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
