//
//  Character.swift
//  Harry Potter
//
//  Created by Tom Johnson on 15/05/2022.
//

import Foundation

class Character: Decodable {
    var name: String
    var alternative_names: [String]
    var species: String
    var gender: String
    var house: String
    var dateOfBirth: String
    var yearOfBirth: Int
    var wizard: Bool
    var ancestory: String
    var eyeColour: String
    var hairColour: String
    var wand: Wand
    var patronus: String
    var hogwartsStudent: Bool
    var hogwartsStaff: Bool
    var actor: String
    var alternative_actors: [String]
    var alive: Bool
    var image: String
}


