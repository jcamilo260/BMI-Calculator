//
//  TitleView.swift
//  BMI Calculator
//
//  Created by Juan Camilo Argüelles Ardila on 11/10/23.
//

import UIKit

class TitleView: UIView {
    
    private let title: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 45, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.text = Datasource.Texts.titleText
        label.textAlignment = .left
        label.numberOfLines = 2
        label.textColor = Datasource.Colors.titleColor
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layout()
    }
    
    private func layout(){
        self.addSubview(self.title)
        NSLayoutConstraint.activate([
            self.title.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.title.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.title.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
    }
    
    

}
