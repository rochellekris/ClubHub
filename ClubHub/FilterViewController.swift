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
    
    var religious: UIButton!
    var honorary: UIButton!
    
    var music: UIButton!
    var studentgov: UIButton!
    var performing: UIButton!
    var professional: UIButton!
    var international: UIButton!
    var publicService: UIButton!
    var theatre: UIButton!
    var cultural: UIButton!
    var recreational: UIButton!
    
    var pressedFilters: [UIButton]!
    
    
    weak var delegate: ChangeFilterDelegate?
    
    init(pressedFilters: [UIButton]) {
        self.pressedFilters = pressedFilters
        for button in pressedFilters {
            button.backgroundColor = .red
        }
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
        
        religious = UIButton()
        religious.backgroundColor = .white
        religious.setTitle("Religious", for: .normal)
        religious.setTitleColor(.black, for: .normal)
        religious.layer.borderColor = UIColor.black.cgColor
        religious.layer.borderWidth = 1
        religious.translatesAutoresizingMaskIntoConstraints = false
        religious.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        religious.addTarget(self, action: #selector(applyUGradFilter), for: .touchUpInside)
        view.addSubview(religious)
        
        honorary = UIButton()
        honorary.backgroundColor = .white
        honorary.setTitle("Honorary", for: .normal)
        honorary.setTitleColor(.black, for: .normal)
        honorary.layer.borderColor = UIColor.black.cgColor
        honorary.layer.borderWidth = 1
        honorary.translatesAutoresizingMaskIntoConstraints = false
        honorary.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        honorary.addTarget(self, action: #selector(applyGradFilter), for: .touchUpInside)
        view.addSubview(honorary)
        
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
        
        for button in pressedFilters {
            button.backgroundColor = .red
        }
        
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
        changeColor(button: religious)
        applyFilter(filter: religious)
        
    }
    
    @objc func applyGradFilter() {
        changeColor(button: honorary)
        applyFilter(filter: honorary)
        
    }
    
    @objc func applyMusicFilter() {
        changeColor(button: music)
        applyFilter(filter: music)
        
    }
    
    @objc func applyStudentGovFilter() {
        changeColor(button: studentgov)
        applyFilter(filter: studentgov)
        
    }
    
    @objc func applyPerformingFilter() {
        changeColor(button: performing)
        applyFilter(filter: performing)
        
    }
    
    @objc func applyProfessionalFilter() {
        changeColor(button: professional)
        applyFilter(filter: professional)
        
    }
    
    @objc func applyInternationalFilter() {
        changeColor(button: international)
        applyFilter(filter: international)
        
    }
    
    @objc func applyPublicServiceFilter() {
        changeColor(button: publicService)
        applyFilter(filter: publicService)
        
    }
    
    @objc func applyTheatreFilter() {
        changeColor(button: theatre)
        applyFilter(filter: theatre)
        
    }
    
    @objc func applyCulturalFilter() {
        changeColor(button: cultural)
        applyFilter(filter: cultural)
        
    }
    
    @objc func applyRecreationalFilter() {
        changeColor(button: recreational)
        applyFilter(filter: recreational)
        
    }
    
    func applyFilter(filter: UIButton) {
        delegate?.changeFilterName(to: filter)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            religious.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -10),
            religious.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
        NSLayoutConstraint.activate([
            honorary.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 10),
            honorary.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
        NSLayoutConstraint.activate([
            music.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -10),
            music.topAnchor.constraint(equalTo: religious.bottomAnchor, constant: 8)
        ])
        NSLayoutConstraint.activate([
            studentgov.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 10),
            studentgov.topAnchor.constraint(equalTo: honorary.bottomAnchor, constant: 8)
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
