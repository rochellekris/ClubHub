//
//  FilterViewController.swift
//  ClubHub
//
//  Created by Rochelle Kris on 11/22/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    var backButton: UIBarButtonItem!
    
    var ugrad: UIButton!
    var grad: UIButton!

    var music: UIButton!
    var studentgov: UIButton!
    var performing: UIButton!
    var professional: UIButton!
    var international: UIButton!
    var publicService: UIButton!
    var theatre: UIButton!
    var cultural: UIButton!
    var recreational: UIButton!
    
    
    

        init(){
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white

            backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissViewController))
            navigationItem.leftBarButtonItem = backButton
            
            ugrad = UIButton()
            ugrad.backgroundColor = .white
            ugrad.setTitle("Undergraduate", for: .normal)
            ugrad.setTitleColor(.black, for: .normal)
            ugrad.layer.borderColor = UIColor.black.cgColor
            ugrad.layer.borderWidth = 1
            ugrad.translatesAutoresizingMaskIntoConstraints = false
            ugrad.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
            view.addSubview(ugrad)
            
            grad = UIButton()
            grad.backgroundColor = .white
            grad.setTitle("Graduate", for: .normal)
            grad.setTitleColor(.black, for: .normal)
            grad.layer.borderColor = UIColor.black.cgColor
            grad.layer.borderWidth = 1
            grad.translatesAutoresizingMaskIntoConstraints = false
            grad.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
            view.addSubview(grad)
            
            music = UIButton()
                       music.backgroundColor = .white
                       music.setTitle("Music", for: .normal)
                       music.setTitleColor(.black, for: .normal)
                       music.layer.borderColor = UIColor.black.cgColor
                       music.layer.borderWidth = 1
                       music.translatesAutoresizingMaskIntoConstraints = false
                       music.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
                       view.addSubview(music)
            
            studentgov = UIButton()
                       studentgov.backgroundColor = .white
                       studentgov.setTitle("Student Government", for: .normal)
                       studentgov.setTitleColor(.black, for: .normal)
                       studentgov.layer.borderColor = UIColor.black.cgColor
                       studentgov.layer.borderWidth = 1
                       studentgov.translatesAutoresizingMaskIntoConstraints = false
                       studentgov.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
                       view.addSubview(studentgov)
            
            performing = UIButton()
                       performing.backgroundColor = .white
                       performing.setTitle("Perfoming", for: .normal)
                       performing.setTitleColor(.black, for: .normal)
                       performing.layer.borderColor = UIColor.black.cgColor
                       performing.layer.borderWidth = 1
                       performing.translatesAutoresizingMaskIntoConstraints = false
                       performing.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
                       view.addSubview(performing)
            
            professional = UIButton()
                       professional.backgroundColor = .white
                       professional.setTitle("Professional", for: .normal)
                       professional.setTitleColor(.black, for: .normal)
                       professional.layer.borderColor = UIColor.black.cgColor
                       professional.layer.borderWidth = 1
                       professional.translatesAutoresizingMaskIntoConstraints = false
                       professional.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
                       view.addSubview(professional)
            
            international = UIButton()
                       international.backgroundColor = .white
                       international.setTitle("International", for: .normal)
                       international.setTitleColor(.black, for: .normal)
                       international.layer.borderColor = UIColor.black.cgColor
                       international.layer.borderWidth = 1
                       international.translatesAutoresizingMaskIntoConstraints = false
                       international.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
                       view.addSubview(international)

            publicService = UIButton()
                       publicService.backgroundColor = .white
                       publicService.setTitle("Public Service", for: .normal)
                       publicService.setTitleColor(.black, for: .normal)
                       publicService.layer.borderColor = UIColor.black.cgColor
                       publicService.layer.borderWidth = 1
                       publicService.translatesAutoresizingMaskIntoConstraints = false
                       publicService.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
                       view.addSubview(publicService)

            theatre = UIButton()
                       theatre.backgroundColor = .white
                       theatre.setTitle("Theatre", for: .normal)
                       theatre.setTitleColor(.black, for: .normal)
                       theatre.layer.borderColor = UIColor.black.cgColor
                       theatre.layer.borderWidth = 1
                       theatre.translatesAutoresizingMaskIntoConstraints = false
                       theatre.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
                       view.addSubview(theatre)

            cultural = UIButton()
                       cultural.backgroundColor = .white
                       cultural.setTitle("Cultural", for: .normal)
                       cultural.setTitleColor(.black, for: .normal)
                       cultural.layer.borderColor = UIColor.black.cgColor
                       cultural.layer.borderWidth = 1
                       cultural.translatesAutoresizingMaskIntoConstraints = false
                       cultural.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
                       view.addSubview(cultural)

            recreational = UIButton()
                       recreational.backgroundColor = .white
                       recreational.setTitle("Recreational", for: .normal)
                       recreational.setTitleColor(.black, for: .normal)
                       recreational.layer.borderColor = UIColor.black.cgColor
                       recreational.layer.borderWidth = 1
                       recreational.translatesAutoresizingMaskIntoConstraints = false
                       recreational.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
                       view.addSubview(recreational)
            setupConstraints()
        }
        
        func setupConstraints() {
            NSLayoutConstraint.activate([
                ugrad.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -10),
                ugrad.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
            ])
            NSLayoutConstraint.activate([
                grad.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 10),
                grad.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
            ])
            NSLayoutConstraint.activate([
                music.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -10),
                music.topAnchor.constraint(equalTo: ugrad.bottomAnchor, constant: 8)
            ])
            NSLayoutConstraint.activate([
                studentgov.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 10),
                studentgov.topAnchor.constraint(equalTo: grad.bottomAnchor, constant: 8)
            ])
            NSLayoutConstraint.activate([
                performing.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -10),
                performing.topAnchor.constraint(equalTo: music.bottomAnchor, constant: 8)
            ])
            NSLayoutConstraint.activate([
                professional.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 10),
                professional.topAnchor.constraint(equalTo: studentgov.bottomAnchor, constant: 8)
            ])
            NSLayoutConstraint.activate([
                international.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -10),
                international.topAnchor.constraint(equalTo: performing.bottomAnchor, constant: 8)
            ])
            NSLayoutConstraint.activate([
                publicService.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 10),
                publicService.topAnchor.constraint(equalTo: professional.bottomAnchor, constant: 8)
            ])
            NSLayoutConstraint.activate([
                theatre.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -10),
                theatre.topAnchor.constraint(equalTo: international.bottomAnchor, constant: 8)
            ])
            NSLayoutConstraint.activate([
                cultural.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 10),
                cultural.topAnchor.constraint(equalTo: publicService.bottomAnchor, constant: 8)
            ])
            NSLayoutConstraint.activate([
                recreational.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                recreational.topAnchor.constraint(equalTo: cultural.bottomAnchor, constant: 8)
            ])
        }
   @objc func dismissViewController() {
        navigationController?.popViewController(animated: true)
    }
}
