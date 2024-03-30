//
//  HomeService.swift
//  RickAndMorty
//
//  Created by Шермат Эшеров on 30/3/24.
//

import Foundation

protocol HomeService {
    func getCharacters(page: Int, completion: @escaping (NetworkResult<Characters?>) -> Void)
}

final class HomeServiceImp: HomeService {
    private let networkService: NetworkService<CharactersEndpoint>

    init(networkService: NetworkService<CharactersEndpoint>) {
        self.networkService = networkService
    }

    func getCharacters(page: Int, completion: @escaping (NetworkResult<Characters?>) -> Void) {
        let endPoint = CharactersEndpoint.getCharacters(page: page.description)
        networkService.request(endpoint: endPoint, completion: completion)
    }
}

