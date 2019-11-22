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
    

    //    init(){
    //        self.textFieldText = textFieldText
    //        super.init(nibName: nil, bundle: nil)
    //    }
        
//        required init?(coder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white

            backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissViewController))
            navigationItem.leftBarButtonItem = backButton
            
//            setupConstraints()
        }
        
//        func setupConstraints() {
//            NSLayoutConstraint.activate([
//            ])
//        }

   @objc func dismissViewController() {
        navigationController?.popViewController(animated: true)
    }
}
