//
//  ClubCollectionViewCell.swift
//  ClubHub
//
//  Created by Rochelle Kris on 11/21/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

import UIKit

class ClubCollectionViewCell: UICollectionViewCell {
    
    
    var clubNameLabel: UILabel! = UILabel()
    var clubDescription: UITextView! = UITextView()
    var levelLabel: UILabel! = UILabel()
    var club: Club?
    
    let padding: CGFloat = 5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        addLabel(label: clubNameLabel, fontSize: 22)
        addLabel(label: levelLabel, fontSize: 12)
        addTextView(textView: clubDescription)
        
        setupConstraints()
    }
    
    func addLabel(label: UILabel!, fontSize: CGFloat) {
        label.font = label.font.withSize(fontSize)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 1
        contentView.addSubview(label)
    }
    
    func addTextView(textView: UITextView) {
        textView.text = ""
        textView.isEditable = false
        textView.textAlignment = .left
        textView.textColor = .black
        contentView.addSubview(textView)
    }
    
    func setupConstraints() {
        
        clubNameLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(padding)
            make.leading.equalTo(contentView.snp.leading).offset(padding)
        }
        levelLabel.snp.makeConstraints { make in
            make.top.equalTo(clubNameLabel.snp.bottom)
            make.leading.equalTo(clubNameLabel.snp.leading)
        }
        clubDescription.snp.makeConstraints { make in
            make.top.equalTo(levelLabel.snp.bottom)
            make.width.equalTo(contentView.snp.width)
            make.bottom.equalTo(contentView.snp.bottom).offset(-padding)
        }

    }
    
    func configure(for club: Club) {
        self.club = club
        
        clubNameLabel.text = club.name
        clubDescription.text = club.description
        levelLabel.text = club.level
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
