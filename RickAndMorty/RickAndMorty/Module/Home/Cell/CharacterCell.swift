//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Шермат Эшеров on 30/3/24.
//

import UIKit

protocol CharacterCellDelegete: AnyObject {
    func characterTapped(charcter: String)
}

final class CharacterCell: UITableViewCell {
    //MARK: Prototype
    private weak var delegate: CharacterCellDelegete?
    private var id: String?
    
    //MARK: Views
    private lazy var horizontalStack: UIStackView = {
        let stackV = UIStackView()
        stackV.axis = .horizontal
        stackV.spacing = 10
        stackV.isUserInteractionEnabled = true
        let target = UITapGestureRecognizer(target: self, action: #selector(tappedCharacter))
        target.delegate = self 
        stackV.addGestureRecognizer(target)
        return stackV
    }()
    
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
    
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Draw
    private func setLayout() {
        setStack()
        horizontalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        horizontalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    private func setStack() {
        contentView.addSubview(horizontalStack)
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.addArrangedSubview(characterImage)
        horizontalStack.addArrangedSubview(characterName)
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        characterImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        characterImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    //MARK: Action
    
    @objc private func tappedCharacter() {
        guard let id = self.id else { return }
        self.delegate?.characterTapped(charcter: id)
    }
    
}

extension CharacterCell: Configurable {
    struct Model {
        weak var delegate: CharacterCellDelegete?
        let name: String
        let image: String
        let id: String
    }
    
    func configure(with model: Model) {
        self.delegate = model.delegate
        self.characterImage.downloadImage(from: model.image)
        self.characterName.text = model.name
        self.id = model.id
    }
}
