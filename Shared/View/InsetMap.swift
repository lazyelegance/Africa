//
//  InsetMap.swift
//  Africa
//
//  Created by Ezra Bathini on 4/01/22.
//

import SwiftUI
import MapKit

struct InsetMap: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(NavigationLink(destination: MapView()) {
                HStack {
                    Image(systemName: "mappin.circle")
                        .foregroundColor(.white)
                        .imageScale(.large)
                    Text("Locations")
                        .foregroundColor(.accentColor)
                        .fontWeight(.bold)
                }
                .padding(.vertical, 10.0)
                .padding(.horizontal, 14.0)
                .background(Color.black
                                .opacity(0.4)
                                .cornerRadius(8))
            }
                        .padding(12), alignment: .topTrailing)
            .frame(height: 256.0)
            .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
    }
}

struct InsetMap_Previews: PreviewProvider {
    static var previews: some View {
        InsetMap().previewLayout(.sizeThatFits).padding()
    }
}
