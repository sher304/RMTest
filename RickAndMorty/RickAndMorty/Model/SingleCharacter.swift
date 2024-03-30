//
//  SingleCharacter.swift
//  RickAndMorty
//
//  Created by Шермат Эшеров on 30/3/24.
//

import Foundation


// MARK: - SingleCharacter
struct SingleCharacter: Codable {
    let id: Int
    let name, species, type: String
    let gender: String
    let image: String
    let episode: [String]
    let url: String
    let created: String
    let status: Status
}
