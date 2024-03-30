//
//  HomeAssembly.swift
//  RickAndMorty
//
//  Created by Шермат Эшеров on 30/3/24.
//

import UIKit

final class HomeAssembly {
    
    static func assemblyModule() -> UIViewController {
        let view = HomeViewController()
        let networkService = CharactersServiceImpl(networkService: NetworkService<CharactersEndpoint>())
        let presenter = HomePresenter()
        let interactor = HomeInteractor(charactersServiceImpl: networkService)
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
}
