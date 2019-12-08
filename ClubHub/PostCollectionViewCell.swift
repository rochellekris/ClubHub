//
//  PostCollectionViewCell.swift
//  ClubHub
//
//  Created by Rafael Chaves on 12/8/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    var postTitle: UILabel!
    var postBody: UITextView!
    var interestedUsers: UIButton!
    var authorLabel: UILabel!
    
    var clubImageView: UIImageView!
    
    
    var photoImageView: UIImageView!
    
    var restaurantNameLabel: UILabel = UILabel()
    var costLabel: UILabel = UILabel()
    var informationLabel: UILabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        addLabel(label: restaurantNameLabel)
        addLabel(label: costLabel)
        addLabel(label: informationLabel)
        
        photoImageView = UIImageView()
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.layer.masksToBounds = true
        photoImageView.layer.cornerRadius = 5
        contentView.addSubview(photoImageView)
        
        setupConstraints()
    }
    
    func addLabel(label: UILabel!) {
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            informationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            informationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            informationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3)
        ])
        
        NSLayoutConstraint.activate([
            restaurantNameLabel.bottomAnchor.constraint(equalTo: informationLabel.topAnchor),
            restaurantNameLabel.leadingAnchor.constraint(equalTo: informationLabel.leadingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            costLabel.topAnchor.constraint(equalTo: restaurantNameLabel.topAnchor),
            costLabel.trailingAnchor.constraint(equalTo: informationLabel.trailingAnchor, constant: -3)
        ])
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: restaurantNameLabel.topAnchor, constant: -3)
        ])
        
    }
    
    func configure(for post: Post) {
        NetworkManager.getUser(user_id: post.author_id) { author in
            self.authorLabel.text = author.name
        }
        postTitle.text = post.title
        postBody.text = post.body
        interestedUsers.setTitle("\(post.interested_users.count)", for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
