//
//  InsetGallery.swift
//  Africa
//
//  Created by Ezra Bathini on 4/01/22.
//

import SwiftUI

struct InsetGallery: View {
    
    let animalGalleryImages: [String]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15.0) {
                ForEach(animalGalleryImages, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(height:200)
                    .cornerRadius(12)
                }
            }
        }
    }
}

struct InsetGallery_Previews: PreviewProvider {
    static var previews: some View {
        InsetGallery(animalGalleryImages: testAnimals[3].gallery).previewLayout(.sizeThatFits).padding()
    }
}
