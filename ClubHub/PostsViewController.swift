//
//  PostsViewController.swift
//  ClubHub
//
//  Created by Rafael Chaves on 12/8/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {
    var posts = [Post]()
    
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
        title = "Posts"
        
        //MARK: Toolbar
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let homeButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(goHome))
        let calButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(goToCal))
        let profileButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(goToProfile))
        toolbarItems = [homeButton, spacer, calButton, spacer, profileButton]
        navigationController?.setToolbarHidden(false, animated: false)
        
        
        searchBar = UISearchBar()
        searchBar.text = "Search posts"
        searchBar.autocorrectionType = .default
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.isHidden = false
        searchBar.delegate = self
        view.addSubview(searchBar)
        
        
        filterButton = UIButton(type: UIButton.ButtonType.system)
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.setTitle("Filter", for: .normal)
        filterButton.tintColor = .black
        filterButton.sizeToFit()
        filterButton.addTarget(self, action: #selector(pushFilterViewController), for: .touchUpInside)
        filterButton.isHidden = false
        view.addSubview(filterButton)
        
        //MARK: CollectionView
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = (padding*2)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
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

    }
    
    @objc func goHome() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func goToCal() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func goToProfile() {
        let viewController = ProfileViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}


extension PostsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! PostCollectionViewCell
        cell.configure(for: posts[indexPath.row])
        return cell
    }
    
    @objc func pushFilterViewController() {
    }
}

extension PostsViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: (collectionView.frame.width)*0.4)
    }
}

extension PostsViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if (searchBar.text == "Search posts") {
            searchBar.text = ""
        }
    }
}
