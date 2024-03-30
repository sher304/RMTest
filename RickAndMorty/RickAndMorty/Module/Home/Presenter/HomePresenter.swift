//
//  HomePresenter.swift
//  RickAndMorty
//
//  Created by Шермат Эшеров on 30/3/24.
//

import Foundation

protocol HomeViewOutput: CharacterCellDelegete {
    func postsScrollEnded()
    func viewIsReady()
    
}

protocol HomeInteractorOutput: AnyObject {
    func getCharacters(characters: Characters)
    func getCharacter(characters: SingleCharacter)
}

final class HomePresenter {
    weak var view: HomeViewInput?
    var interactor: HomeInteractorInput?
    private var page: Int = 1
    private var characters: [Result] = []
    
}

// MARK: HomeViewOutput
extension HomePresenter: HomeViewOutput {
    func postsScrollEnded() {
        page += 1
        interactor?.getCharacters(page: self.page)
    }
    
    func viewIsReady() {
        interactor?.getCharacters(page: self.page)
    }
    
    func characterTapped(charcter: String) {
        interactor?.getCharacter(id: charcter)
    }
}


// MARK: HomeInteractorOutput
extension HomePresenter: HomeInteractorOutput {
    func getCharacters(characters: Characters) {
        self.characters.append(contentsOf: characters.results)
        self.view?.updateTable(characters: self.characters)
    }
    
    func getCharacter(characters: SingleCharacter) {
        view?.pushToDetail(character: characters)
    }
}

