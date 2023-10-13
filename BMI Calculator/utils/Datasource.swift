//
//  Datasource.swift
//  BMI Calculator
//
//  Created by Juan Camilo Argüelles Ardila on 11/10/23.
//

import Foundation
import UIKit

struct Datasource{
    struct Colors{
        public static let mainColorButton: UIColor = UIColor(red: 98/255, green: 96/255, blue: 153/255, alpha: 1)
        public static let skinnyScreenColor: UIColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        public static let healthyScreenColor: UIColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        public static let fatScreenColor: UIColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        public static let titleColor: UIColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
        public static let smallLabelColor: UIColor = UIColor(red: 116/255, green: 116/255, blue: 116/255, alpha: 1)
        public static let sliderColor: UIColor = UIColor(red: 188/255, green: 189/255, blue: 228/255, alpha: 1)
        
    }
    
    struct Texts{
        public static let titleText: String = "CALCULATE YOUR BMI"
        public static let heightTitleText: String = "Height"
        public static let weightTitleText: String = "Weight"
        
    }
}
