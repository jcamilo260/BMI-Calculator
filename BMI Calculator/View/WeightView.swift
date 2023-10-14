//
//  WeightView.swift
//  BMI Calculator
//
//  Created by Juan Camilo Argüelles Ardila on 13/10/23.
//

import Foundation
import UIKit

class WeightView: UIView{
    
    private let heightTitle: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Datasource.Colors.smallLabelColor
        label.text = Datasource.Texts.weightTitleText
        label.numberOfLines = 1
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        return label
    }()
    
    private let numberTitle: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Datasource.Colors.smallLabelColor
        label.numberOfLines = 1
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        return label
    }()
    
    private let weightSlider: UISlider = {
        let slider: UISlider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 40
        slider.maximumValue = 130
        slider.value = 1.6
        slider.tintColor =  Datasource.Colors.sliderColor
        slider.thumbTintColor = Datasource.Colors.sliderColor
        return slider
    }()
    
    private lazy var horizontalStack: UIStackView = {
        let stack: UIStackView = UIStackView(arrangedSubviews: [heightTitle, numberTitle])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 220
        return stack
    }()
    
    private lazy var verticalStack: UIStackView = {
        let stack: UIStackView = UIStackView(arrangedSubviews: [horizontalStack, weightSlider])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    public func setNumberTitle(number: Float){
        let convertedNumber = String(format: "%.0f", number)
        self.numberTitle.text = "\(convertedNumber)Kg"
    }
    
    public var _weightSlider: UISlider{
        return self.weightSlider
    }
    
    public var _numberTitle: Float{
        return Float(String(format: "%.0f", self.weightSlider.value)) ?? 0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layout()
    }
    
    private func layout(){
        self.setupVerticalStack()
        self.numberTitle.text = "\(String(format: "%.0f", self.weightSlider.minimumValue))\(Datasource.Texts.weightPrefix)"
    }
    
    private func setupVerticalStack(){
        self.addSubview(self.verticalStack)
        NSLayoutConstraint.activate([
            self.verticalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.verticalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.verticalStack.topAnchor.constraint(equalTo: self.topAnchor),
            self.verticalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
