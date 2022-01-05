//
//  CoverImage.swift
//  Africa
//
//  Created by Ezra Bathini on 2/01/22.
//

import SwiftUI

struct CoverImagesView: View {
    
    var coverImages: CoverImages = Bundle.main.decode("covers.json")
    
    var body: some View {
        
        TabView {
            CoverImagesSubView(coverImages: coverImages)
        }
        #if os(macOS)
        .tabViewStyle(.automatic)
        #else
        .tabViewStyle(PageTabViewStyle())
        #endif
    }
}

struct CoverImage_Previews: PreviewProvider {
    static var previews: some View {
        CoverImagesView().previewLayout(.fixed(width: 400, height: 300))
    }
}

struct CoverImagesSubView: View {
    var coverImages: CoverImages
    var body: some View {
        ForEach(coverImages) {
            Image($0.name)
                .resizable()
                .scaledToFill()
        }
    }
}
