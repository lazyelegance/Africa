//
//  HomeView.swift
//  Africa
//
//  Created by Ezra Bathini on 2/01/22.
//

import SwiftUI

fileprivate enum GridType {
    case onebytwo
    case twobytwo
    case threebytwo
    
    
    
    func gridIcon() -> String {
        switch self {
        case .onebytwo:
            return "rectangle.grid.1x2"
        case .twobytwo:
            return "rectangle.grid.2x2"
        case .threebytwo:
            return "rectangle.grid.3x2"
        }
    }
    
    func gridColumns() -> Double {
        switch self {
        case .onebytwo:
            return 1
        case .twobytwo:
            return 2
        case .threebytwo:
            return 3
        }
    }
    
    func nextItem() -> GridType {
        switch self {
        case .onebytwo:
            return .twobytwo
        case .twobytwo:
            return .threebytwo
        case .threebytwo:
            return .onebytwo
        }
    }
}



struct HomeView: View {
    
    let animals: Animals = Bundle.main.decode("animals.json")
    
    @State private var isGridActive = false
    
    @State private var gridType: GridType = .twobytwo
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    @State var gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 1)
    
    func switchGridlayout() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridType.gridColumns()))
    }
    
    var body: some View {
        NavigationView {
            Group {
                if isGridActive {
                    ScrollView {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: ADetailView(animal: animal)) {
                                    AnimalGridItem(animal: animal)
                                } }
                        }
                        .padding(10)
                        .animation(.easeIn, value: 3)
                        CreditsView().modifier(CenterModifier())
                    }
                    .onAppear {
                        switchGridlayout()
                    }
                } else {
                    List {
                        CoverImagesView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(destination: ADetailView(animal: animal)) {
                                AnimalListItem(animal: animal)
                            }
                        }
                        CreditsView().modifier(CenterModifier())
                    }
                }
                
            }
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            isGridActive = false
                            hapticImpact.impactOccurred()
                            
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridActive ? .primary : .accentColor)
                        }
                        
                        Button(action: {
                            if isGridActive {
                                gridType = gridType.nextItem()
                                withAnimation(.easeIn) {
                                    switchGridlayout()
                                }
                            } else {
                                isGridActive = true
                            }
                            hapticImpact.impactOccurred()
                        }) {
                            Image(systemName:isGridActive ? gridType.nextItem().gridIcon() : gridType.gridIcon())
                                .font(.title2)
                                .foregroundColor(isGridActive ? .accentColor : .primary)
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

