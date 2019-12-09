//
//  PostCollectionViewCell.swift
//  ClubHub
//
//  Created by Rafael Chaves on 12/8/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

import UIKit
import SnapKit

class PostCollectionViewCell: UICollectionViewCell {
    
    var postTitle: UILabel! = UILabel()
    var postBody: UITextView! = UITextView()
    var authorLabel: UILabel! = UILabel()
    var likeButton: UIButton = UIButton()
    var post: Post?
    
    let padding: CGFloat = 5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        addLabel(label: postTitle, fontSize: 22)
        addLabel(label: authorLabel, fontSize: 12)
        addTextView(textView: postBody)
        addLikeButton()
        
        setupConstraints()
    }
    
    func addLabel(label: UILabel!, fontSize: CGFloat) {
        label.font = label.font.withSize(fontSize)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 1
        contentView.addSubview(label)
    }
    
    func addLikeButton() {
        likeButton.setTitle("Like", for: .normal)
        likeButton.setTitleColor(.systemRed, for: .normal)
        likeButton.addTarget(self, action: #selector(likePost), for: .touchUpInside)
        likeButton.layer.borderWidth = 1
        likeButton.layer.cornerRadius = 4
        likeButton.layer.borderColor = UIColor.systemRed.cgColor
        likeButton.titleLabel?.font = .systemFont(ofSize: 13)
        likeButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        contentView.addSubview(likeButton)
    }
    
    func addTextView(textView: UITextView) {
        textView.text = ""
        textView.isEditable = false
        textView.textAlignment = .left
        textView.textColor = .black
        contentView.addSubview(textView)
    }
    
    func setupConstraints() {
        
        likeButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(padding)
            make.trailing.equalTo(contentView.snp.trailing).offset(-padding)
        }
        postTitle.snp.makeConstraints { make in
            make.top.equalTo(likeButton.snp.top)
            make.leading.equalTo(contentView.snp.leading).offset(padding)
        }
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(postTitle.snp.bottom)
            make.leading.equalTo(postTitle.snp.leading)
        }
        postBody.snp.makeConstraints { make in
            make.top.equalTo(authorLabel.snp.bottom)
            make.width.equalTo(contentView.snp.width)
            make.bottom.equalTo(contentView.snp.bottom).offset(-padding)
        }

    }
    
    @objc func likePost() {
        if let unwrappedPost = post {
            NetworkManager.addFavoritePost(post_id: unwrappedPost.id) { success, message in
                if (success == false) {
                    
                }
                else {
                    
                }
            }
        }
    }
    
    func configure(for post: Post) {
        self.post = post
        NetworkManager.getUser(user_id: post.author_id) { author in
            self.authorLabel.text = "Posted by: \(author.email)"
        }
        postTitle.text = post.title
        postBody.text = post.body
        likeButton.setTitle("Like (\(post.interested_users.count) interested)", for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
