//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Шермат Эшеров on 30/3/24.
//

import UIKit

protocol HomeViewInput: AnyObject {
    func updateTable(characters: [Result])
    func pushToDetail(character: SingleCharacter)
}

final class HomeViewController: UIViewController {
    var presenter: HomeViewOutput?
    var characters: [Result] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .green
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewIsReady()
        setLayout()
    }
    
    private func setLayout() {
        view.backgroundColor = .orange
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(
                            equalTo: view.safeAreaLayoutGuide.topAnchor,
                            constant: 10).isActive = true
        tableView.leadingAnchor.constraint(
                            equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                            constant: 12).isActive = true
        tableView.trailingAnchor.constraint(
                            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                            constant: -12).isActive = true
        tableView.trailingAnchor.constraint(
                            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                            constant: 8).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CharacterCell()
        let character = self.characters[indexPath.row]
        cell.configure(with: CharacterCell.Model(delegate: presenter,
                                                 name: character.name,
                                                 image: character.image,
                                                 id: character.id.description
                                                ))
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (self.characters.count) - 1 {
            presenter?.postsScrollEnded()
        }
    }
}

// MARK: HomeViewInput
extension HomeViewController: HomeViewInput {
    func updateTable(characters: [Result]) {
        self.characters = characters
        self.tableView.reloadData()
    }
    
    func pushToDetail(character: SingleCharacter) {
        let vc = DetailViewController()
        vc.configure(with: DetailViewController.Model(singleCharacter: character))
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
