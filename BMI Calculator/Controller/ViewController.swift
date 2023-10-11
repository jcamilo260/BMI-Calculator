//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Juan Camilo Argüelles Ardila on 11/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let backgroundImage: UIImageView = UIImageView()
    private let titleView: TitleView = TitleView()
    private let button: CustomButton = CustomButton()
    private lazy var vStack: UIStackView = {
        let stack: UIStackView = UIStackView(arrangedSubviews: [titleView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .leading
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.layout()
        self.buttonAction()
    }
    
    private func layout(){
        self.setupImage()
        self.setupButton()
        self.setupStackView()
        
    }
    
    private func buttonAction(){
        self.button.addTarget(self, action: #selector(performButtonAction), for: .touchUpInside)
    }
    
    @objc private func performButtonAction(sender: CustomButton){
        sender.shake()
    }
    
    private func setupImage(){
        self.view.addSubview(self.backgroundImage)
        
        self.backgroundImage.image = UIImage(named: "calculate_background")
        self.backgroundImage.contentMode = .scaleAspectFit
        self.backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.backgroundImage.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.backgroundImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    private func setupStackView(){
        self.view.addSubview(self.vStack)
        self.vStack.backgroundColor = .blue
        NSLayoutConstraint.activate([
            self.vStack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.vStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.vStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            self.vStack.bottomAnchor.constraint(equalTo: self.button.topAnchor, constant: -10)
        ])
    }
    
    private func setupButton(){
        self.view.addSubview(self.button)
        self.button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.button.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            self.button.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            self.button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            self.button.heightAnchor.constraint(equalToConstant: 80)
        ])
    }


}

