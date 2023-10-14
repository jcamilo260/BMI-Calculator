//
//  LabelFactory.swift
//  BMI Calculator
//
//  Created by Juan Camilo Argüelles Ardila on 14/10/23.
//

import Foundation
import UIKit

struct LabelFactory{
    
    public static func build(font: UIFont, text: String, textAlignment: NSTextAlignment?, color: UIColor)->UILabel{
        let label: UILabel = UILabel()
        label.font = font
        label.text = text
        label.textColor = color
        if let textAlignment = textAlignment{
            label.textAlignment = textAlignment
        }
        return label
    }
    
}
