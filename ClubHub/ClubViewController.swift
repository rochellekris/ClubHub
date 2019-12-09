//
//  ClubViewController.swift
//  ClubHub
//
//  Created by Rafael Chaves on 12/9/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

import UIKit

class ClubViewController: UIViewController {
    
    var club: Club
    
    var levelLabel: UILabel! = UILabel()
    var categoryLabel: UILabel! = UILabel()
    var hrefLabel: UILabel! = UILabel()
    var appReqLabel: UILabel! = UILabel()
    
    var clubDescription: UITextView! = UITextView()
    
    init(club: Club) {
        self.club = club
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
        title = club.name
        
        addTextView(textView: clubDescription, text: club.description, fontSize: 20)
        
        addLabel(label: levelLabel, text: "Level: " + club.level, fontSize: 18)
        addLabel(label: categoryLabel, text: "Category: " + club.category, fontSize: 18)
        if let href = club.href {
            addLabel(label: hrefLabel, text: "Link: " + href, fontSize: 18)
        }
        else {
            addLabel(label: hrefLabel, text: "", fontSize: 18)
        }
        
        if let appReq = club.application_required {
            addLabel(label: appReqLabel, text: "Application Required: " + String(appReq), fontSize: 18)
        }
        else {
            addLabel(label: appReqLabel, text: "Application Required: Unknown", fontSize: 18)
        }
        
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
        levelLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalTo(view.snp.centerX)
        }
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(levelLabel.snp.bottom).offset(10)
        }
        hrefLabel.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(10)
        }
        appReqLabel.snp.makeConstraints { make in
            make.top.equalTo(hrefLabel.snp.bottom).offset(10)
        }
        
        clubDescription.snp.makeConstraints { make in
            make.top.equalTo(appReqLabel.snp.bottom).offset(30)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

}
