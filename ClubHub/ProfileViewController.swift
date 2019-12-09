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
    
    let padding: CGFloat = 8
    

            override func viewDidLoad() {
                super.viewDidLoad()
                view.backgroundColor = .white
               
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
                view.addSubview(netIDText)
                
                passLabel = UILabel()
                passLabel.text = "Password"
                passLabel.textColor = .black
                passLabel.textAlignment = .center
                passLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
                passLabel.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(passLabel)
                
                passText = UITextView()
                passText.text = ""
                passText.textColor = .black
                passText.isEditable = true
                passText.isHidden = false
                passText.layer.borderColor = UIColor.systemGray.cgColor
                passText.layer.borderWidth = 1
                passText.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(passText)
                
                loginButton = UIButton(type: UIButton.ButtonType.system)
                loginButton.translatesAutoresizingMaskIntoConstraints = false
                loginButton.setTitle("Login", for: .normal)
                loginButton.setTitleColor(.white, for: .normal)
                loginButton.backgroundColor = .red
                loginButton.addTarget(self, action: #selector(loginFunc), for: .touchUpInside)
                loginButton.isHidden = false
                view.addSubview(loginButton)
                
                setupConstraints()
            }
            
        func setupConstraints() {
            NSLayoutConstraint.activate([
                logoImage.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding*2),
                logoImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -30),
                logoImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                logoImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding*5)
            ])
            
            NSLayoutConstraint.activate([
                clubHubLabel.topAnchor.constraint(equalTo: logoImage.topAnchor),
                clubHubLabel.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 2),
                clubHubLabel.bottomAnchor.constraint(equalTo: logoImage.bottomAnchor)
            ])
            
            
            NSLayoutConstraint.activate([
                netIDLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding*2),
                netIDLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -padding*2)
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
        }

       
    @objc func dismissViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc func loginFunc() {
        if let netid = netIDText.text, let password = passText.text {
            NetworkManager.login(email: netid, password: password) { success, message in
                if (success == true) {
                    
                }
                else {
                    
                }
            }
        }
    }
}
