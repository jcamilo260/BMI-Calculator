//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Juan Camilo Argüelles Ardila on 11/10/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    private var result: String?
    private var advice: String?
    private var backgroundColor: UIColor?
    
    public func setResult(result: String){
        self.result = result
    }
    
    public func setAdvice(advice: String){
        self.advice = advice
    }
    
    public func setBackgroundColor(color: UIColor){
        self.backgroundColor = color
    }

    private let backgroundImage: UIImageView = {
        let image: UIImageView = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "result_background")
        return image
    }()
    
    private let resultTitleLabel: UILabel = {
        let label: UILabel = LabelFactory.build(
            font: UIFont.systemFont(ofSize: 30, weight: .bold),
            text: Datasource.Texts.resultText,
            textAlignment: .center,
            color: .white)
        return label
    }()
    
    private lazy var resultLabel: UILabel = {
        let label: UILabel = LabelFactory.build(
            font: UIFont.systemFont(ofSize: 70, weight: .heavy),
            text: self.result ?? "11.22",
            textAlignment: .center,
            color: .white)
        return label
    }()
    
    private lazy var adviceLabel: UILabel = {
        let label: UILabel = LabelFactory.build(
            font: UIFont.systemFont(ofSize: 22, weight: .light),
            text: self.advice ?? "Here is the advice",
            textAlignment: .center,
            color: .white)
        return label
    }()

    
    private lazy var vStack: UIStackView = {
        let vStack: UIStackView = UIStackView(arrangedSubviews: [resultTitleLabel, resultLabel, adviceLabel])
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.axis = .vertical
        vStack.spacing = -20
        return vStack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.layout()
        
    }
    
    private func layout(){
        self.setupBackgroundImage()
        self.setupStackView()
        self.view.backgroundColor = self.backgroundColor
    }
    
    private func setupStackView(){
        self.view.addSubview(self.vStack)
        NSLayoutConstraint.activate([
            self.vStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.vStack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    private func setupBackgroundImage(){
        self.view.addSubview(self.backgroundImage)
        NSLayoutConstraint.activate([
            self.backgroundImage.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.backgroundImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }

}
