//
//  PostsViewController.swift
//  ClubHub
//
//  Created by Rafael Chaves on 12/8/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

import UIKit
import SnapKit

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
        
        let post1 = Post(id: 1, title: "Test Post Title", body: "Test Post Description", author_id: 1, interested_users: [])
        posts = [post1, post1, post1]
        setupToolBar()
        setupSearchBar()
        setupFilterButton()
        setupCollectionView()
        setupConstraints()
    }
    
    func setupToolBar() {
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let homeButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(goHome))
        let calButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(goToCal))
        let profileButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(goToProfile))
        toolbarItems = [homeButton, spacer, calButton, spacer, profileButton]
        navigationController?.setToolbarHidden(false, animated: false)
    }
    
    func setupSearchBar() {
        searchBar = UISearchBar()
        searchBar.text = "Search posts"
        searchBar.autocorrectionType = .default
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.isHidden = false
        searchBar.delegate = self
        view.addSubview(searchBar)
    }
    
    func setupFilterButton() {
        filterButton = UIButton(type: UIButton.ButtonType.system)
        filterButton.setTitle("Filter", for: .normal)
        filterButton.tintColor = .black
        filterButton.sizeToFit()
        filterButton.addTarget(self, action: #selector(pushFilterViewController), for: .touchUpInside)
        filterButton.isHidden = false
        view.addSubview(filterButton)
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = (padding*2)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        
        collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        collectionView.register(PostCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setupConstraints() {
        filterButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(padding)
            make.bottom.equalTo(searchBar.snp.bottom)
            make.leading.equalTo(view.snp.trailing).offset(-60)
            make.trailing.equalTo(view.snp.trailing).offset(-padding)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(padding)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(75)
            make.leading.equalTo(view.snp.leading).offset(padding)
            make.trailing.equalTo(filterButton.snp.leading).offset(padding)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(padding)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(view.snp.leading).offset(padding)
            make.trailing.equalTo(view.snp.trailing).offset(-padding)
        }
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
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
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

