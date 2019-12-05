//
//  ViewController.swift
//  ClubHub
//
//  Created by Rochelle Kris on 11/19/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    var clubs = [Club]()
    var users = [User]()
    
    var searchBar: UISearchBar!
    var filterButton: UIButton!
  
    var collectionView: UICollectionView!
    
    let cellReuseIdentifier = "cellReuseIdentifier"
    let headerReuseIdentifier = "headerReuseIdentifier"
    let padding: CGFloat = 8
    let headerHeight: CGFloat = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Clubs"
        
        //MARK: Toolbar
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let homeButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(goHome))
        let calButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(goToCal))
        let profileButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(goToProfile))
        toolbarItems = [homeButton, spacer, calButton, spacer, profileButton]
        navigationController?.setToolbarHidden(false, animated: false)
        
        
        searchBar = UISearchBar()
        searchBar.text = "Search clubs"
        searchBar.autocorrectionType = .default
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.isHidden = false
        view.addSubview(searchBar)
        
        
        filterButton = UIButton(type: UIButton.ButtonType.system)
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.setTitle("Filter", for: .normal)
        filterButton.tintColor = .black
        filterButton.sizeToFit()
        filterButton.addTarget(self, action: #selector(pushFilterViewController), for: .touchUpInside)
        filterButton.isHidden = false
        view.addSubview(filterButton)
        
        let club1 = Club(id: 1, name: "test", description: "description", level: "Undergraduate", application_required: true, interested_users: users, category: "test", href: "test")
        let club2 = Club(id: 2, name: "test2", description: "description2", level: "Graduate", application_required: false, interested_users: users, category: "test", href: "test")
        
        clubs = [club1, club2, club1, club2, club2, club1, club1, club1, club2, club1, club2, club2, club1, club1, club1, club2, club1, club2, club2, club1, club1, club1, club2, club1, club2, club2, club1, club1]

        //MARK: CollectionView
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = (padding*2)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
//        collectionView.layer.shadowRadius = 10
        view.addSubview(collectionView)
        
        collectionView.register(ClubCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        collectionView.register(ClubCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self

        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            filterButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            filterButton.bottomAnchor.constraint(equalTo: searchBar.bottomAnchor),
            filterButton.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            filterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            searchBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 75),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            searchBar.trailingAnchor.constraint(equalTo: filterButton.leadingAnchor, constant: -padding)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: padding),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)

        ])
    }
    
    func getClubs(parameters: [String: Any]) {
        NetworkManager.getClubs(parameters: parameters) { clubs in
            print(clubs)
        }
    }
    
    func register(name: String, email: String, password: String) {
        NetworkManager.register(name: name, email: email, password: password)
    }
    
    func login(email: String, password: String) {
        NetworkManager.login(email: email, password: password)
    }

    @objc func goHome() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func goToCal() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func goToProfile() {
        dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        clubs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! ClubCollectionViewCell
        cell.configure(for: clubs[indexPath.row])
        return cell
        
    }
    
    @objc func pushFilterViewController() {
    let viewController = FilterViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: (collectionView.frame.width)*0.4)
    }
}
