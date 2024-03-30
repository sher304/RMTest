//
//  Endpoint.swift
//  RickAndMorty
//
//  Created by Шермат Эшеров on 30/3/24.
//

import Foundation

protocol EndpointProtocol {
    var baseUrl: String { get }
    var path: String { get }

}

extension EndpointProtocol {
    var baseUrl: String {
        return "https://rickandmortyapi.com/api/"
    }
}
