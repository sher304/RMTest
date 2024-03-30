//
//  CharactersImpl.swift
//  RickAndMorty
//
//  Created by Шермат Эшеров on 30/3/24.
//

import Foundation


protocol CharactersService {
    func getCharacter(id: String, completion: @escaping (NetworkResult<SingleCharacter?>) -> Void)
    func getCharacters(page: String?, completion: @escaping(NetworkResult<Characters?>) -> Void)
}

final class CharactersServiceImpl: CharactersService {
    
    private let networkService: NetworkService<CharactersEndpoint>
    
    init(networkService: NetworkService<CharactersEndpoint>) {
        self.networkService = networkService
    }
    
    func getCharacter(id: String, completion: @escaping (NetworkResult<SingleCharacter?>) -> Void) {
        
        let endpoint = CharactersEndpoint.getCharacter(id: id )
        networkService.request(endpoint: endpoint, completion: completion)
    }
    
    func getCharacters(page: String?, completion: @escaping(NetworkResult<Characters?>) -> Void) {
        let enpoint = CharactersEndpoint.getCharacters(page: page ?? "1")
        networkService.request(endpoint: enpoint, completion: completion)
    }
}
