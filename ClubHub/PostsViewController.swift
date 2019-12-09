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
    var searchButton: UIButton!
    
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
        
        getPosts()
        setupToolBar()
        setupSearchBar()
        setupSearchButton()
        setupCollectionView()
        setupConstraints()
    }
    
    func getPosts() {
        NetworkManager.getPosts(parameters: [:]) { posts in
            self.posts = posts
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func setupToolBar() {
        //MARK: Toolbar
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let homeButton = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(goHome))
        let postButton = UIBarButtonItem(title: "Post", style:.plain, target: self, action: #selector(goToPost))
        let profileButton = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(goToProfile))
        toolbarItems = [homeButton, spacer, postButton, spacer, profileButton]

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
    
    func setupSearchButton() {
        searchButton = UIButton(type: UIButton.ButtonType.system)
        searchButton.setTitle("Search", for: .normal)
        searchButton.tintColor = .black
        searchButton.sizeToFit()
        searchButton.addTarget(self, action: #selector(getQueriedPosts), for: .touchUpInside)
        searchButton.isHidden = false
        view.addSubview(searchButton)
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
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(padding)
            make.bottom.equalTo(searchBar.snp.bottom)
            make.leading.equalTo(view.snp.trailing).offset(-60)
            make.trailing.equalTo(view.snp.trailing).offset(-padding)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(padding)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(75)
            make.leading.equalTo(view.snp.leading).offset(padding)
            make.trailing.equalTo(searchButton.snp.leading).offset(padding)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(padding)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(view.snp.leading).offset(padding)
            make.trailing.equalTo(view.snp.trailing).offset(-padding)
        }
    }
    
    @objc func goHome() {
        navigationController?.pushViewController(ViewController(), animated: true)
    }

    @objc func goToPost() {
        navigationController?.pushViewController(PostsViewController(), animated: true)
    }
    
    @objc func goToProfile() {
        navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
    @objc func getQueriedPosts() {
        if let searchText = searchBar.text {
            let parameters: [String: Any] = [
                "search_query": searchText
            ]
            NetworkManager.getPosts(parameters: parameters) { posts in
                self.posts = posts
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
}


extension PostsViewController: UICollectionViewDataSource {
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
}

extension PostsViewController: UICollectionViewDelegateFlowLayout {
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

extension PostsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        navigationController?.pushViewController(PostViewController(post: posts[indexPath.row]), animated: true)
    }
}

