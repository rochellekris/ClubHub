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
    
    var tabs: UITabBarController!
    var mainFeedView: ViewController!
    var profileView: ProfileViewController!
    
    let cellReuseIdentifier = "cellReuseIdentifier"
    let headerReuseIdentifier = "headerReuseIdentifier"
    let padding: CGFloat = 8
    let headerHeight: CGFloat = 30
    
    var filterSelected: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Clubs"
        
        //MARK: Toolbar
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let homeButton = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(goHome))
//            UIBarButtonItem(image: (UIImage(contentsOfFile: "homeImage")), style: .plain, target: self, action: #selector(goHome))
        let postButton = UIBarButtonItem(title: "Post", style:.plain, target: self, action: #selector(goToPost))
        let profileButton = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(goToProfile))
        toolbarItems = [homeButton, spacer, postButton, spacer, profileButton]

        navigationController?.setToolbarHidden(false, animated: false)
        
//        createTabBarController()
        
        searchBar = UISearchBar()
        searchBar.text = "Search clubs"
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
    
    func getClubs() {
        if let searchText = searchBar.text, !searchText.isEmpty || filterSelected != "" {
            var parameters: [String: Any] = [
                "search_query": searchText,
            ]
            if (filterSelected != "") {
                parameters["category"] = filterSelected
            }
            print(parameters)
            NetworkManager.getClubs(parameters: parameters) { clubs in
                self.clubs = clubs
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }

    @objc func goHome() {
        if (navigationController?.topViewController != self) {
            navigationController?.pushViewController(ViewController(), animated: true)
        }
    }

    @objc func goToPost() {
        navigationController?.pushViewController(PostsViewController(), animated: true)
    }
    
    @objc func goToProfile() {
        navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
//    func createTabBarController(){
//
//        tabs = UITabBarController()
//
//        mainFeedView = ViewController()
//        mainFeedView.tabBarItem.image = UIImage(named: "homeImage")
//
//        profileView = ProfileViewController()
//        profileView.tabBarItem.image = UIImage(named: "profileImage")
//
//        tabs.viewControllers = [mainFeedView, profileView]
//
//        view.addSubview(tabs.view)
//
//    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        clubs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! ClubCollectionViewCell
        cell.configure(for: clubs[indexPath.row])
        return cell
        
    }
    
    @objc func pushFilterViewController() {
        let filterViewController = FilterViewController()
        filterViewController.delegate = self
        navigationController?.pushViewController(filterViewController, animated: true)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: (collectionView.frame.width)*0.4)
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if (searchBar.text == "Search clubs") {
            searchBar.text = ""
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText.count >= 3 || filterSelected != "") {
            getClubs()
        }
    }
}

protocol ChangeFilterDelegate: class {
    func changeFilterName(to newString: String)
}

extension ViewController: ChangeFilterDelegate {
    func changeFilterName(to newString: String) {
        filterSelected = newString
    }
}
