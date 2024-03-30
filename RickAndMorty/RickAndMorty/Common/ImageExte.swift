//
//  ImageExte.swift
//  RickAndMorty
//
//  Created by Шермат Эшеров on 30/3/24.
//

import UIKit

extension UIImageView {
    func downloadImage(from url: String) {
        guard let url = URL(string: url) else { return }
        
        func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
            URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
        }
        
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = UIImage(data: data)
            }
        }
    }
}
