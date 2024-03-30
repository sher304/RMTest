//
//  Configure.swift
//  RickAndMorty
//
//  Created by Шермат Эшеров on 30/3/24.
//

import Foundation

protocol Configurable {
    associatedtype Model
    func configure(with model: Model)
}
