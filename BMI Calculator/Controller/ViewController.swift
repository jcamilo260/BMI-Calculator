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
    private let heightView: HeightView = HeightView()
    private let weightView: WeightView = WeightView()
    private lazy var calculator: Calculator = Calculator()

    private let button: CustomButton = CustomButton()
    private lazy var vStack: UIStackView = {
        let stack: UIStackView = UIStackView(arrangedSubviews: [titleView, heightView, weightView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.layout()
        self.setupEvents()
    }
    
    private func layout(){
        self.setupImage()
        self.setupButton()
        self.setupStackView()
        self.setupTitleView()
        self.setupHeightView()
        self.setupWeightView()
    }
    
        
    //MARK: - Setup UI Components
    
    private func setupStackView(){
        self.view.addSubview(self.vStack)
        NSLayoutConstraint.activate([
            self.vStack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.vStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.vStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            self.vStack.bottomAnchor.constraint(equalTo: self.button.topAnchor, constant: -40)
        ])
    }
    
    private func setupTitleView(){
        self.titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleView.heightAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    private func setupHeightView(){
        self.heightView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setupWeightView(){
        self.weightView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.weightView.heightAnchor.constraint(equalToConstant: 80)
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
    
    //MARK: - Events behaviour
    
    private func setupEvents(){
        self.buttonAction()
        self.setupSliderBehaviour()
    }
    
    private func setupSliderBehaviour(){
        self.heightView._heigthSlider.addTarget(self, action: #selector(heightSliderChanged), for: .valueChanged)
        self.weightView._weightSlider.addTarget(self, action: #selector(weightSliderChanged), for: .valueChanged)
    }
    
    private func buttonAction(){
        self.button.addTarget(self, action: #selector(performButtonAction), for: .touchUpInside)
    }
    
    @objc private func performButtonAction(sender: CustomButton){
        sender.shake()
        
        let heightValue: Float? = Float(self.heightView._numberTitle)
        let weightValue: Float? = Float(self.weightView._numberTitle)
        
        if let heightValue = heightValue,
           let weightValue = weightValue{
            print(self.calculator.calculate(height: heightValue, weight: weightValue))
        }else{
            print("Something with the values has gone wrong")
            return
        }
    }
    
    @objc private func heightSliderChanged(_ sender: UISlider){
        self.heightView.setNumberTitle(number: sender.value)
    }
    
    @objc private func weightSliderChanged(_ sender: UISlider){
        self.weightView.setNumberTitle(number: sender.value)
    }
}

