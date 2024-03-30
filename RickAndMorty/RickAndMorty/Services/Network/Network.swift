//
//  Network.swift
//  RickAndMorty
//
//  Created by Шермат Эшеров on 30/3/24.
//

import Foundation

protocol NetworkDelegate: AnyObject {
    func parseData(completion: @escaping (Characters) -> Void)
    func parseById(id: String, completion: @escaping (SingleCharacter) -> Void)
}

final class NetworkService<Endpoint: EndpointProtocol> {
    
    // MARK: - Request
    func request<Response>(endpoint: Endpoint, completion: @escaping (NetworkResult<Response>) -> Void) where Response: Decodable {
        
        let url = URLComponents(string: endpoint.baseUrl + endpoint.path)
        guard let resultURL = url?.url else { return }
        var request = URLRequest(url: resultURL)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            let result: NetworkResult<Response>
            
            guard response != nil else {
                result = NetworkResult.failure(error?.localizedDescription ?? "nil")
                return
            }
            
            guard let data = data else {
                return
            }
            
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            do {
                let object = try JSONDecoder().decode(Response.self, from: data)
                result = NetworkResult.success(object)
            } catch let error {
                NSLog("CheckError \(error)")
                result = NetworkResult.failure(error.localizedDescription)
            }
        }
        .resume()
    }
    
}

