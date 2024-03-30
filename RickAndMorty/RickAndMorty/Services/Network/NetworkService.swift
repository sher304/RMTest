//
//  NetworkService.swift
//  RickAndMorty
//
//  Created by Шермат Эшеров on 30/3/24.
//

import Foundation

public enum NetworkResult<Model> {
    case success(Model)
    case failure(String)
    
    public var isSuccess: Bool {
        switch self {
        case .success:      return true
        case .failure:      return false
        }
    }
    
    public var isFailure: Bool {
        return !isSuccess
    }
    
    public var value: Model? {
        switch self {
        case .success(let value):   return value
        case .failure:              return nil
        }
    }
    
    public var error: String? {
        switch self {
        case .success:              return nil
        case .failure(let error):   return error
        }
    }
}
