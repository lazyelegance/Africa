//
//  Heading.swift
//  Africa
//
//  Created by Ezra Bathini on 4/01/22.
//

import SwiftUI

struct Heading: View {
    var headingImage: String
    var headingText: String
    
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

struct Heading_Previews: PreviewProvider {
    static var previews: some View {
        Heading(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
