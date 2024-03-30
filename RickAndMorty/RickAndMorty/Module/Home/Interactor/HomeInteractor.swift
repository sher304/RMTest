//
//  HomeInteractor.swift
//  RickAndMorty
//
//  Created by Шермат Эшеров on 30/3/24.
//

import Foundation

protocol HomeInteractorInput {
    func getCharacters(page: Int)
    func getCharacter(id: String)
}

final class HomeInteractor: HomeInteractorInput {
    var presenter: HomeInteractorOutput?
    var charactersServiceImpl: CharactersServiceImpl
    
    init(charactersServiceImpl: CharactersServiceImpl) {
        self.charactersServiceImpl = charactersServiceImpl
    }
    
    func getCharacters(page: Int) {
        charactersServiceImpl.getCharacters(page: page.description) { [weak self] result in
            switch result {
            case .success(let model):
                guard let data = model else { return }
                self?.presenter?.getCharacters(characters: data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getCharacter(id: String) {
        charactersServiceImpl.getCharacter(id: id) { [weak self] result in
            switch result {
            case .success(let model):
                guard let data = model else { return }
                self?.presenter?.getCharacter(characters: data)
            case .failure(let error):
                print(error)
            }
        }
    }
}


