//
//  CustomButton.swift
//  BMI Calculator
//
//  Created by Juan Camilo Argüelles Ardila on 11/10/23.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layout()
    }
    
    private func layout(){
        self.setupShape()
        //self.setupShadow()
    }
    
    private func setupShape(){
        self.clipsToBounds = true
        self.titleLabel?.font = .systemFont(ofSize: 40)
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.numberOfLines = 1
        self.backgroundColor = Datasource.Colors.mainColorButton
        self.titleLabel?.textColor = .white
        self.setTitle("CALCULATE", for: .normal)
        self.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
    }
    
    private func setupShadow(){
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 1
        self.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowRadius = 0
    }
    
    public func shake(){
        let shakeAnimation = CABasicAnimation(keyPath: "position")
                shakeAnimation.duration = 0.03
                shakeAnimation.repeatCount = 2
                shakeAnimation.autoreverses = true

        let fromPoint = CGPoint(x: self.layer.position.x - 5, y: self.layer.position.y)
        let toPoint = CGPoint(x: self.layer.position.x + 5, y: self.layer.position.y)

                shakeAnimation.fromValue = NSValue(cgPoint: fromPoint)
                shakeAnimation.toValue = NSValue(cgPoint: toPoint)

        self.layer.add(shakeAnimation, forKey: "position")
    }
    
}
