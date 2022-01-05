//
//  AnimalGridItem.swift
//  Africa
//
//  Created by Ezra Bathini on 5/01/22.
//

import SwiftUI

struct AnimalGridItem: View {
    
    let animal: Animal
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItem_Previews: PreviewProvider {
    static var previews: some View {
        AnimalGridItem(animal: testAnimals[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
