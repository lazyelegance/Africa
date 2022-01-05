//
//  ADetailView.swift
//  Africa
//
//  Created by Ezra Bathini on 4/01/22.
//

import SwiftUI

struct ADetailView: View {
    
    var animal: Animal
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20.0) {
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(Color.accentColor
                                    .frame(height: 6)
                                    .offset(y:24))
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                Group {
                    Heading(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in pictures")
                    InsetGallery(animalGalleryImages: animal.gallery)
                }.padding(.horizontal)
                Group {
                    Heading(headingImage: "questionmark.circle", headingText: "Did you know")
                    InsetFacts(animalFacts: animal.fact)
                }.padding(.horizontal)
                Group {
                    Heading(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }.padding(.horizontal)
                Group {
                    Heading(headingImage: "map", headingText: "National parks")
                    InsetMap()
                }.padding(.horizontal)
                Group {
                    Heading(headingImage: "books.vertical", headingText: "Learn more")
                    ExternalWebLink(linkName: animal.name, link: animal.link)
                }.padding(.horizontal)
            }
            .navigationBarTitle("Learn more about: \(animal.name)", displayMode: .inline)
        }
    }
}

struct ADetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ADetailView(animal: testAnimals[2])
        }
    }
}
