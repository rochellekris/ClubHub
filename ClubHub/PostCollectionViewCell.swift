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
    var interestedUsers: UIButton! = UIButton()
    var authorLabel: UILabel! = UILabel()
    
    let padding: CGFloat = 5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        addLabel(label: postTitle, fontSize: 22)
        addLabel(label: authorLabel, fontSize: 12)
        addTextView(textView: postBody)
        addButton(button: interestedUsers)
        
        setupConstraints()
    }
    
    func addLabel(label: UILabel!, fontSize: CGFloat) {
        label.font = label.font.withSize(fontSize)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 1
        contentView.addSubview(label)
    }
    
    func addButton(button: UIButton!) {
        button.setTitleColor(.systemRed, for: .normal)
        button.addTarget(self, action: #selector(showUsers), for: .touchUpInside)
        contentView.addSubview(button)
    }
    
    func addTextView(textView: UITextView) {
        textView.text = ""
        textView.isEditable = false
        textView.textAlignment = .left
        textView.textColor = .black
        contentView.addSubview(textView)
    }
    
    func setupConstraints() {
        
        interestedUsers.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(padding)
            make.trailing.equalTo(contentView.snp.trailing).offset(-padding)
        }
        postTitle.snp.makeConstraints { make in
            make.top.equalTo(interestedUsers.snp.top)
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
    
    @objc func showUsers() {
        
    }
    
    func configure(for post: Post) {
        NetworkManager.getUser(user_id: post.author_id) { author in
            self.authorLabel.text = "Posted by: \(author.name)"
        }
        postTitle.text = post.title
        postBody.text = post.body
        interestedUsers.setTitle("\(post.interested_users.count)", for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
