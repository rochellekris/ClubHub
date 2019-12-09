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
    
    var sportsClubNC: UIButton!
    var sportsClubC: UIButton!
    
    var music: UIButton!
    var studentgov: UIButton!
    var performing: UIButton!
    var professional: UIButton!
    var international: UIButton!
    var publicService: UIButton!
    var theatre: UIButton!
    var cultural: UIButton!
    var recreational: UIButton!
    
    var pressedFilters: [UIButton]! = []
    
    
    weak var delegate: ChangeFilterDelegate?
    
    init() {
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
        
        sportsClubNC = UIButton()
        sportsClubNC.backgroundColor = .white
        sportsClubNC.setTitle("Sport Club - Non-competitive", for: .normal)
        sportsClubNC.setTitleColor(.black, for: .normal)
        sportsClubNC.layer.borderColor = UIColor.black.cgColor
        sportsClubNC.layer.borderWidth = 1
        sportsClubNC.translatesAutoresizingMaskIntoConstraints = false
        sportsClubNC.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        sportsClubNC.addTarget(self, action: #selector(applyUGradFilter), for: .touchUpInside)
        view.addSubview(sportsClubNC)
        
        sportsClubC = UIButton()
        sportsClubC.backgroundColor = .white
        sportsClubC.setTitle("Sport Club - Competitive", for: .normal)
        sportsClubC.setTitleColor(.black, for: .normal)
        sportsClubC.layer.borderColor = UIColor.black.cgColor
        sportsClubC.layer.borderWidth = 1
        sportsClubC.translatesAutoresizingMaskIntoConstraints = false
        sportsClubC.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        sportsClubC.addTarget(self, action: #selector(applyGradFilter), for: .touchUpInside)
        view.addSubview(sportsClubC)
        
        music = UIButton()
        music.backgroundColor = .white
        music.setTitle("Music", for: .normal)
        music.setTitleColor(.black, for: .normal)
        music.layer.borderColor = UIColor.black.cgColor
        music.layer.borderWidth = 1
        music.translatesAutoresizingMaskIntoConstraints = false
        music.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        music.addTarget(self, action: #selector(applyMusicFilter), for: .touchUpInside)
        view.addSubview(music)
        
        studentgov = UIButton()
        studentgov.backgroundColor = .white
        studentgov.setTitle("Student Government", for: .normal)
        studentgov.setTitleColor(.black, for: .normal)
        studentgov.layer.borderColor = UIColor.black.cgColor
        studentgov.layer.borderWidth = 1
        studentgov.translatesAutoresizingMaskIntoConstraints = false
        studentgov.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        studentgov.addTarget(self, action: #selector(applyStudentGovFilter), for: .touchUpInside)
        view.addSubview(studentgov)
        
        performing = UIButton()
        performing.backgroundColor = .white
        performing.setTitle("Perfoming", for: .normal)
        performing.setTitleColor(.black, for: .normal)
        performing.layer.borderColor = UIColor.black.cgColor
        performing.layer.borderWidth = 1
        performing.translatesAutoresizingMaskIntoConstraints = false
        performing.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        performing.addTarget(self, action: #selector(applyPerformingFilter), for: .touchUpInside)
        view.addSubview(performing)
        
        professional = UIButton()
        professional.backgroundColor = .white
        professional.setTitle("Professional", for: .normal)
        professional.setTitleColor(.black, for: .normal)
        professional.layer.borderColor = UIColor.black.cgColor
        professional.layer.borderWidth = 1
        professional.translatesAutoresizingMaskIntoConstraints = false
        professional.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        professional.addTarget(self, action: #selector(applyProfessionalFilter), for: .touchUpInside)
        view.addSubview(professional)
        
        international = UIButton()
        international.backgroundColor = .white
        international.setTitle("International", for: .normal)
        international.setTitleColor(.black, for: .normal)
        international.layer.borderColor = UIColor.black.cgColor
        international.layer.borderWidth = 1
        international.translatesAutoresizingMaskIntoConstraints = false
        international.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        international.addTarget(self, action: #selector(applyInternationalFilter), for: .touchUpInside)
        view.addSubview(international)
        
        publicService = UIButton()
        publicService.backgroundColor = .white
        publicService.setTitle("Public Service", for: .normal)
        publicService.setTitleColor(.black, for: .normal)
        publicService.layer.borderColor = UIColor.black.cgColor
        publicService.layer.borderWidth = 1
        publicService.translatesAutoresizingMaskIntoConstraints = false
        publicService.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        publicService.addTarget(self, action: #selector(applyPublicServiceFilter), for: .touchUpInside)
        view.addSubview(publicService)
        
        theatre = UIButton()
        theatre.backgroundColor = .white
        theatre.setTitle("Theatre", for: .normal)
        theatre.setTitleColor(.black, for: .normal)
        theatre.layer.borderColor = UIColor.black.cgColor
        theatre.layer.borderWidth = 1
        theatre.translatesAutoresizingMaskIntoConstraints = false
        theatre.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        theatre.addTarget(self, action: #selector(applyTheatreFilter), for: .touchUpInside)
        view.addSubview(theatre)
        
        cultural = UIButton()
        cultural.backgroundColor = .white
        cultural.setTitle("Cultural", for: .normal)
        cultural.setTitleColor(.black, for: .normal)
        cultural.layer.borderColor = UIColor.black.cgColor
        cultural.layer.borderWidth = 1
        cultural.translatesAutoresizingMaskIntoConstraints = false
        cultural.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        cultural.addTarget(self, action: #selector(applyCulturalFilter), for: .touchUpInside)
        view.addSubview(cultural)
        
        recreational = UIButton()
        recreational.backgroundColor = .white
        recreational.setTitle("Recreational", for: .normal)
        recreational.setTitleColor(.black, for: .normal)
        recreational.layer.borderColor = UIColor.black.cgColor
        recreational.layer.borderWidth = 1
        recreational.translatesAutoresizingMaskIntoConstraints = false
        recreational.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        recreational.addTarget(self, action: #selector(applyRecreationalFilter), for: .touchUpInside)
        view.addSubview(recreational)
        
        setupConstraints()
    }
    
    func changeColor(button: UIButton){
        if (pressedFilters.count > 0) {
            pressedFilters[0].backgroundColor = .white
            pressedFilters.remove(at: 0)
        }
        if (button.backgroundColor == .red) {
            button.backgroundColor = .white
        }
        else {
            pressedFilters.append(button)
            button.backgroundColor = .red
        }
    }
    
    @objc func applyUGradFilter() {
        if let text = sportsClubNC.titleLabel?.text {
            changeColor(button: sportsClubNC)
            applyFilter(name: text)
        }
    }
    
    @objc func applyGradFilter() {
        if let text = sportsClubC.titleLabel?.text {
            changeColor(button: sportsClubC)
            applyFilter(name: text)
        }
    }
    
    @objc func applyMusicFilter() {
        if let text = music.titleLabel?.text {
            changeColor(button: music)
            applyFilter(name: text)
        }
    }
    
    @objc func applyStudentGovFilter() {
        if let text = studentgov.titleLabel?.text {
            changeColor(button: studentgov)
            applyFilter(name: text)
        }
    }
    
    @objc func applyPerformingFilter() {
        if let text = performing.titleLabel?.text {
            changeColor(button: performing)
            applyFilter(name: text)
        }
    }
    
    @objc func applyProfessionalFilter() {
        if let text = professional.titleLabel?.text {
            changeColor(button: professional)
            applyFilter(name: text)
        }
    }
    
    @objc func applyInternationalFilter() {
        if let text = international.titleLabel?.text {
            changeColor(button: international)
            applyFilter(name: text)
        }
    }
    
    @objc func applyPublicServiceFilter() {
        if let text = publicService.titleLabel?.text {
            changeColor(button: publicService)
            applyFilter(name: text)
        }
    }
    
    @objc func applyTheatreFilter() {
        if let text = theatre.titleLabel?.text {
            changeColor(button: theatre)
            applyFilter(name: text)
        }
    }
    
    @objc func applyCulturalFilter() {
        if let text = cultural.titleLabel?.text {
            changeColor(button: cultural)
            applyFilter(name: text)
        }
    }
    
    @objc func applyRecreationalFilter() {
        if let text = recreational.titleLabel?.text {
            changeColor(button: recreational)
            applyFilter(name: text)
        }
    }
    
    func applyFilter(name: String) {
        delegate?.changeFilterName(to: name)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            sportsClubNC.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -10),
            sportsClubNC.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
        NSLayoutConstraint.activate([
            sportsClubC.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 10),
            sportsClubC.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
        NSLayoutConstraint.activate([
            music.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -10),
            music.topAnchor.constraint(equalTo: sportsClubNC.bottomAnchor, constant: 8)
        ])
        NSLayoutConstraint.activate([
            studentgov.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 10),
            studentgov.topAnchor.constraint(equalTo: sportsClubC.bottomAnchor, constant: 8)
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
