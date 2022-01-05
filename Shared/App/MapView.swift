//
//  MapView.swift
//  Africa
//
//  Created by Ezra Bathini on 2/01/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        return MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
    }()
    
    let locations: NationalParkLocations = Bundle.main.decode("locations.json")
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { location in
//            MapPin(coordinate: location.location, tint: .accentColor)
//            MapMarker(coordinate: location.location, tint: .accentColor)
//            MapAnnotation(coordinate: location.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32.0, height: 32.0, alignment: .center)
//            }
            MapAnnotation(coordinate: location.location) {
                MapAnnotationView(locationImage: location.image)
            }
        }
        .overlay(
            HStack(alignment: .center, spacing: 16.0) {
                Image("compass")
                    .resizable()
                    .frame(width: 48, height: 48, alignment: .center)
                VStack {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(Color.black.opacity(0.6))
                .cornerRadius(8)
                .padding()
            , alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
