//
//  DetailService.swift
//  RickAndMorty
//
//  Created by Шермат Эшеров on 30/3/24.
//

import Foundation

enum CharactersEndpoint: EndpointProtocol {
    case getCharacter(id: String)
    case getCharacters(page: String?)

    var path: String {
        switch self {
        case .getCharacters(let page):
            return API.characters + (page ?? "1")
            
        case .getCharacter(let id):
            return API.characterId + id
        }
    }
}
