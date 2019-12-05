//
//  ClubCollectionViewCell.swift
//  ClubHub
//
//  Created by Rochelle Kris on 11/21/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

import UIKit

class ClubCollectionViewCell: UICollectionViewCell {
    
    var clubImageView: UIImageView!
//    var clubName: UILabel!
//    var clubDescrip: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //ROUND CORNERS
        clubImageView = UIImageView()
        clubImageView.translatesAutoresizingMaskIntoConstraints = false
        clubImageView.contentMode = .scaleAspectFill
        clubImageView.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        clubImageView.layer.cornerRadius = 10
        contentView.addSubview(clubImageView)
        
//        clubName = UILabel()
//        clubName.backgroundColor = .white
//        clubName.textColor = .black
//        clubName.textAlignment = .left
//        clubName.font = UIFont.systemFont(ofSize: 14, weight: .regular)
//        clubName.translatesAutoresizingMaskIntoConstraints = false
//        clubImageView.contentMode = .scaleAspectFill
//        clubName.layer.masksToBounds = true
//        contentView.addSubview(clubName)
//
//        clubDescrip = UILabel()
//        clubDescrip.backgroundColor = .white
//        clubDescrip.textColor = .darkGray
//        clubDescrip.textAlignment = .left
//        clubDescrip.font = UIFont.systemFont(ofSize: 14, weight: .regular)
//        clubDescrip.translatesAutoresizingMaskIntoConstraints = false
//        clubImageView.contentMode = .scaleAspectFill
//        clubDescrip.layer.masksToBounds = true
//        contentView.addSubview(clubName)
//
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            clubImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            clubImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            clubImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            clubImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
//        NSLayoutConstraint.activate([
//            clubName.topAnchor.constraint(equalTo: clubImageView.bottomAnchor),
//            clubName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            clubName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            clubName.bottomAnchor.constraint(equalTo: clubImageView.bottomAnchor, constant: -20)
//        ])
//
//        NSLayoutConstraint.activate([
//            clubDescrip.topAnchor.constraint(equalTo: clubName.bottomAnchor),
//            clubDescrip.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            clubDescrip.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            clubDescrip.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
    }
    
    func configure(for club: Club) {
        clubImageView.image = UIImage(named: "mensHockey")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
