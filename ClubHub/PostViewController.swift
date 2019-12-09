//
//  PostViewController.swift
//  ClubHub
//
//  Created by Rafael Chaves on 12/8/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    var post: Post
    var authorLabel: UILabel! = UILabel()
    var bodyTextView: UITextView! = UITextView()
    var interestedUsersLabel: UILabel! = UILabel()
    var interestedUsersTextView: UITextView! = UITextView()
    
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.largeTitleTextAttributes = nil
        navigationController?.navigationBar.prefersLargeTitles = false
        title = post.title
        
        addTextView(textView: bodyTextView, text: post.body, fontSize: 20)
        bodyTextView.layer.borderWidth = 1
        bodyTextView.layer.borderColor = UIColor.lightGray.cgColor
        
        var userlist: String = ""
        for user in post.interested_users {
            userlist += user.email
        }
        addTextView(textView: interestedUsersTextView, text: userlist, fontSize: 18)
        addLabel(label: authorLabel, text: "", fontSize: 18)
        NetworkManager.getUser(user_id: post.author_id) { author in
            self.authorLabel.text = author.email
        }
        addLabel(label: interestedUsersLabel, text: "Interested Users:", fontSize: 18)
        
        setupConstraints()
    }
    
    func addTextView(textView: UITextView, text: String, fontSize: CGFloat) {
        textView.text = text
        textView.font = .systemFont(ofSize: fontSize)
        textView.isEditable = false
        textView.textAlignment = .left
        textView.textColor = .black
        view.addSubview(textView)
    }
    
    func addLabel(label: UILabel!, text: String, fontSize: CGFloat) {
        label.text = text
        label.font = label.font.withSize(fontSize)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 1
        view.addSubview(label)
    }
    
    func setupConstraints() {
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        bodyTextView.snp.makeConstraints { make in
            make.top.equalTo(authorLabel.snp.bottom).offset(30)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-view.frame.height*1/3)
        }
        
        interestedUsersLabel.snp.makeConstraints { make in
            make.top.equalTo(bodyTextView.snp.bottom).offset(20)
            make.leading.equalTo(bodyTextView.snp.leading)
        }
        
        interestedUsersTextView.snp.makeConstraints { make in
            make.top.equalTo(interestedUsersLabel.snp.top).offset(20)
            make.leading.trailing.equalTo(bodyTextView)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
