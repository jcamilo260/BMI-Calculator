//
//  HeightView.swift
//  BMI Calculator
//
//  Created by Juan Camilo Argüelles Ardila on 12/10/23.
//

import UIKit

class HeightView: UIView {

    private let heightTitle: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Datasource.Colors.smallLabelColor
        label.text = Datasource.Texts.heightTitleText
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
        label.text = "0m"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        return label
    }()
    
    private let heightSlider: UISlider = {
        let slider: UISlider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 1.4
        slider.maximumValue = 2.1
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
        let stack: UIStackView = UIStackView(arrangedSubviews: [horizontalStack, heightSlider])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    public func setNumberTitle(number: Float){
        let convertedNumber = String(format: "%.2f", number)
        self.numberTitle.text = "\(convertedNumber)m"
    }
    
    public var _heigthSlider: UISlider {
        return self.heightSlider
    }
    
    public var _numberTitle: Float{
        return Float(String(format: "%.2f", self.heightSlider.value)) ?? 0
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
        self.numberTitle.text = "\(self.heightSlider.minimumValue)\(Datasource.Texts.heightPrefix)"
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
