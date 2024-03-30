//
//  DetailViewController.swift
//  RickAndMorty
//
//  Created by Шермат Эшеров on 30/3/24.
//

import UIKit

final class DetailViewController: UIViewController {

    // MARK: Views
    private lazy var characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .orange
        return imageView
    }()
    
    private lazy var characterName: UILabel = {
        let label = UILabel()
        label.text = "Sam"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var characterStatus: UILabel = {
        let label = UILabel()
        label.text = "Sam"
        label.textColor = .green
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    private func setLayout() {
        view.backgroundColor = .white
        view.addSubview(characterImage)
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        characterImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 14).isActive = true
        characterImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        characterImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        characterImage.heightAnchor.constraint(equalToConstant: 230).isActive = true
        
        view.addSubview(characterName)
        characterName.translatesAutoresizingMaskIntoConstraints = false
        characterName.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 15).isActive = true
        characterName.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -15).isActive = true
        
        view.addSubview(characterStatus)
        characterStatus.translatesAutoresizingMaskIntoConstraints = false
        characterStatus.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 15).isActive = true
        characterStatus.leadingAnchor.constraint(equalTo: characterName.trailingAnchor, constant: 10).isActive = true
    }
}


extension DetailViewController: Configurable {
    struct Model {
        let singleCharacter: SingleCharacter
    }
    
    func configure(with model: Model) {
        self.characterImage.downloadImage(from: model.singleCharacter.image)
        self.characterName.text = model.singleCharacter.name
        self.characterStatus.text = model.singleCharacter.status
        switch (model.singleCharacter.status) {
        case "Alive":
            self.characterStatus.textColor = .green
        case "Dead":
            self.characterStatus.textColor = .red
        default:
            self.characterStatus.textColor = .blue
        }
    }
}
