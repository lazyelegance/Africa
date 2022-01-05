//
//  AnimalListItem.swift
//  Africa
//
//  Created by Ezra Bathini on 3/01/22.
//

import SwiftUI

struct AnimalListItem: View {
    var animal: Animal
    var body: some View {
        HStack(alignment: .center, spacing: 16.0) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90.0, height: 90.0)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading, spacing: 8.0) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(animal.description) 
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }
                
        }
    }
}

struct AnimalListItem_Previews: PreviewProvider {
    static var previews: some View {
        AnimalListItem(animal: testAnimals[0]).previewLayout(.sizeThatFits).padding()
    }
}
