//
//  InsetFacts.swift
//  Africa
//
//  Created by Ezra Bathini on 4/01/22.
//

import SwiftUI

struct InsetFacts: View {
    let animalFacts: [String]
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animalFacts, id: \.self) {
                    Text($0)
                }
            }
            #if os(macOS)
            .tabViewStyle(.automatic)
            #else
            .tabViewStyle(PageTabViewStyle())
            #endif
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

struct InsetFacts_Previews: PreviewProvider {
    static var previews: some View {
        InsetFacts(animalFacts: testAnimals[1].fact)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
