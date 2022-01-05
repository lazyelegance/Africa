//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Ezra Bathini on 4/01/22.
//

import SwiftUI

struct MapAnnotationView: View {
    var locationImage: String
    
    
    @State private var animation: Double = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54.0, height: 54.0, alignment: .center)
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52.0, height: 52.0, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            Image(locationImage)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            .clipShape(Circle())
        }
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationView(locationImage: testLocations[0].image).previewLayout(.sizeThatFits).padding()
    }
}
