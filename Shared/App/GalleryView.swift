//
//  GalleryView.swift
//  Africa
//
//  Created by Ezra Bathini on 2/01/22.
//

import SwiftUI

struct GalleryView: View {
    
    let animals: Animals = Bundle.main.decode("animals.json")
    
    
    @State var selectedAnimal: Animal?
    
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())]
    
    @State var gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 1)
    
    @State var gridColumns = 3.0
    
    func switchGrid() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumns))
    }

    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30.0) {
                if animals.count > 0 {
                    GalleryImage(image: selectedAnimal != nil ? selectedAnimal?.image as! String : animals[0].image, lineWidth: 8)
                } else {
                    EmptyView()
                }
                Slider(value: $gridColumns, in: 2...4, step: 1) { value in
                    switchGrid()
                }
                .padding(.horizontal)
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { animal in
                        GalleryImage(image: animal.image, lineWidth: 1)
                            .onTapGesture {
                                selectedAnimal = animal
                            }
                    }
                }
                .animation(.easeIn)
                .onAppear {
                    switchGrid()
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

struct GalleryImage: View {
    var image: String
    var lineWidth: CGFloat
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: lineWidth))
            
    }
}
