//
//  ProfileViewController.swift
//  ClubHub
//
//  Created by Rochelle Kris on 12/8/19.
//  Copyright © 2019 Rochelle Kris. All rights reserved.
//
import UIKit

class ProfileViewController: UIViewController {
    
    var logoImage: UIImageView!
    
    var clubHubLabel: UILabel!
    
    var netIDLabel: UILabel!
    var netIDText: UITextView!
    var passLabel: UILabel!
    var passText: UITextView!
    
    var loginButton: UIButton!
    var registerButton: UIButton!
    
    let padding: CGFloat = 8
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupToolBar()
        
        logoImage = UIImageView()
        logoImage.image = UIImage(named: "Cornell C")
        logoImage.clipsToBounds = true
        logoImage.contentMode = .scaleAspectFit
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImage)
        
        clubHubLabel = UILabel()
        clubHubLabel.text = "lubHub"
        clubHubLabel.textColor = .black
        clubHubLabel.textAlignment = .center
        clubHubLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        clubHubLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(clubHubLabel)
        
        netIDLabel = UILabel()
        netIDLabel.text = "NetID"
        netIDLabel.textColor = .black
        netIDLabel.textAlignment = .center
        netIDLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        netIDLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(netIDLabel)
        
        netIDText = UITextView()
        netIDText.text = ""
        netIDText.textColor = .black
        netIDText.isEditable = true
        netIDText.isHidden = false
        netIDText.layer.borderColor = UIColor.systemGray.cgColor
        netIDText.layer.borderWidth = 1
        netIDText.translatesAutoresizingMaskIntoConstraints = false
        netIDText.autocorrectionType = .no
        netIDText.autocapitalizationType = .none
        view.addSubview(netIDText)
        
        passLabel = UILabel()
        passLabel.text = "Password"
        passLabel.textColor = .black
        passLabel.textAlignment = .center
        passLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        passLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passLabel)
        
        passText = UITextView()
        passText.isSecureTextEntry = true
        passText.text = ""
        passText.textColor = .black
        passText.isEditable = true
        passText.isHidden = false
        passText.layer.borderColor = UIColor.systemGray.cgColor
        passText.layer.borderWidth = 1
        passText.translatesAutoresizingMaskIntoConstraints = false
        passText.autocorrectionType = .no
        view.addSubview(passText)
        
        loginButton = UIButton(type: UIButton.ButtonType.system)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .systemRed
        loginButton.addTarget(self, action: #selector(loginFunc), for: .touchUpInside)
        loginButton.isHidden = false
        view.addSubview(loginButton)
        
        registerButton = UIButton(type: UIButton.ButtonType.system)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.backgroundColor = .systemRed
        registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        registerButton.isHidden = false
        view.addSubview(registerButton)
        
        NetworkManager.getCurrentUserId { success, message, user in
            if(success) {
                self.goHome()
            }
        }
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            clubHubLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            clubHubLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 2),
            clubHubLabel.bottomAnchor.constraint(equalTo: netIDLabel.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: clubHubLabel.topAnchor),
            logoImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            logoImage.trailingAnchor.constraint(equalTo: clubHubLabel.leadingAnchor, constant: -2),
            logoImage.bottomAnchor.constraint(equalTo: clubHubLabel.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            netIDLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding*2),
            netIDLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -padding*3)
        ])
        
        NSLayoutConstraint.activate([
            netIDText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding*2),
            netIDText.topAnchor.constraint(equalTo: netIDLabel.bottomAnchor, constant: padding),
            netIDText.bottomAnchor.constraint(equalTo: netIDLabel.bottomAnchor, constant: padding*5),
            netIDText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding*2)
        ])
        
        NSLayoutConstraint.activate([
            passLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding*2),
            passLabel.topAnchor.constraint(equalTo: netIDLabel.bottomAnchor, constant: padding*6)
        ])
        
        NSLayoutConstraint.activate([
            passText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding*2),
            passText.topAnchor.constraint(equalTo: passLabel.bottomAnchor, constant: padding),
            passText.bottomAnchor.constraint(equalTo: passLabel.bottomAnchor, constant: padding*5),
            passText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding*2)
        ])
        
        
        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding*3),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding*3),
            loginButton.topAnchor.constraint(equalTo: passText.bottomAnchor, constant: padding)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding*3),
            registerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding*3),
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: padding)
        ])
    }
    
    func setupToolBar() {
        //MARK: Toolbar
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let homeButton = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(goHome))
        let postButton = UIBarButtonItem(title: "Post", style:.plain, target: self, action: #selector(goToPost))
        let profileButton = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(goToProfile))
        toolbarItems = [homeButton, spacer, postButton, spacer, profileButton]

        navigationController?.setToolbarHidden(false, animated: false)
    }
    
    @objc func dismissViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func goHome() {
        navigationController?.pushViewController(ViewController(), animated: true)
    }

    @objc func goToPost() {
        navigationController?.pushViewController(PostsViewController(), animated: true)
    }
    
    @objc func goToProfile() {
        navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
    
    @objc func loginFunc() {
        if let netid = netIDText.text, let password = passText.text {
            NetworkManager.login(email: netid + "@cornell.edu", password: password) { success, message in
                if (success != true) {
                    print(message)
                }
                else {
                    self.goHome()
                }
            }
        }
    }
    
    @objc func register() {
        if let netid = netIDText.text, let password = passText.text {
            NetworkManager.register(email: netid + "@cornell.edu", password: password) { success, message in
                if (success != true) {
                    print(message)
                }
                else {
                    self.goHome()
                }
            }
        }
    }
}
