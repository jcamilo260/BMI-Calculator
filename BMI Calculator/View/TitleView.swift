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
        label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.text = "CALCULATE YOUR BMI"
        label.textAlignment = .left
        label.textColor = UIColor.gray
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layout()
        self.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layout()
    }
    
    private func layout(){
        self.addSubview(self.title)
        NSLayoutConstraint.activate([
            self.title.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.title.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
    }
    
    

}
