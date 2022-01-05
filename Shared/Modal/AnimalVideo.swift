//
//  AnimalVideo.swift
//  Africa
//
//  Created by Ezra Bathini on 4/01/22.
//

import Foundation


struct AnimalVideo: Identifiable, Codable {
    let id, name, headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}

typealias AnimalVideos = [AnimalVideo]


#if DEBUG
let testVideos: AnimalVideos = Bundle.main.decode("videos.json")
#endif
