//
//  AccountViewController.swift
//  TestesUnitarios
//
//  Created by Gabriele Namie on 14/02/23.
//

import UIKit

class AccountViewController: UIViewController {
    let instructionLabel = UILabel()
    let loginButton = UIButton()
    var viewModel: AccountViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButtonSetup()
        instructionLabelSetup()
        
        viewModel?.shouldRequestLocation(showAlert: {
            print("Alerta")
        }, askUserPermission: {
            print("Get user location")
        }, completion: {
            print("Completion")
        })
        
        instructionLabel.text = viewModel?.instructionText
        
        Provider().getJoke { jokes, Error in
            print(jokes)
        }
    }
    func instructionLabelSetup() {
        instructionLabel.text = "Instructions"
        instructionLabel.tintColor = .white
        instructionLabel.backgroundColor = .green
        view.addSubview(instructionLabel)
        instructionLabel.frame = CGRect(x: 100, y: 300, width: 200, height: 50)
    }
    func loginButtonSetup() {
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .blue
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
    }
    @objc func loginButtonAction() {
        viewModel?.loginButtonTap()
    }
}
