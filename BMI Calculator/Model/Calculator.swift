//
//  Calculator.swift
//  BMI Calculator
//
//  Created by Juan Camilo Argüelles Ardila on 13/10/23.
//

import Foundation
import UIKit

struct Calculator{
    var bmi: BMI?
    
    public var color: UIColor{
        return self.bmi?.color ?? .white
    }
    
    public var calculation: Float{
        return self.bmi?.value ?? 0
    }
    
    public var advice: String{
        return self.bmi?.advice ?? "Advice here"
    }
        
    public mutating func calculate(height: Float, weight: Float)->BMI{
        var calcualtion = weight / (height * height)
        calcualtion = Float(String(format: "%.2f", calcualtion)) ?? 0
        
        if calcualtion < Datasource.ClasificationData.skinnyBound{
            self.bmi = BMI(value: calcualtion, advice: Datasource.Texts.skinnyAdvice, color: Datasource.Colors.skinnyScreenColor)
        }
        if calcualtion >= Datasource.ClasificationData.skinnyBound && calcualtion < Datasource.ClasificationData.FatBound{
            self.bmi = BMI(value: calcualtion, advice: Datasource.Texts.fitAdvice, color: Datasource.Colors.healthyScreenColor)
        }else{
            self.bmi = BMI(value: calcualtion, advice: Datasource.Texts.fatAdvice, color: Datasource.Colors.fatScreenColor)
        }
        return self.bmi!
    }
}
