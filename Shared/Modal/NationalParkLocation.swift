//
//  NationalParkLocation.swift
//  Africa
//
//  Created by Ezra Bathini on 4/01/22.
//

import Foundation
import MapKit

struct NationalParkLocation: Identifiable, Codable {
    let id, name, image: String
    let latitude, longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

typealias NationalParkLocations = [NationalParkLocation]

#if DEBUG
let testLocations: NationalParkLocations = Bundle.main.decode("locations.json")
#endif
