//
//  Animal.swift
//  Africa
//
//  Created by Ezra Bathini on 3/01/22.
//

import Foundation

struct Animal: Identifiable, Codable {
    let id, name, headline, description: String
    let link: String
    let image: String
    let gallery, fact: [String]

//    enum CodingKeys: String, CodingKey {
//        case id, name, headline
//        case animalDescription = "description"
//        case link, image, gallery, fact
//    }
}

typealias Animals = [Animal]


#if DEBUG
let testAnimals: Animals = Bundle.main.decode("animals.json")
#endif
