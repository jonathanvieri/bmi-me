//
//  CalculatorManager.swift
//  BMI Me
//
//  Created by Jonathan Vieri on 16/08/22.
//

import Foundation
import SwiftUI

struct CalculatorManager {
    
    //MARK: - Variables
    
    var bmi: BMI?
    var height: Float
    var weight: Float
    
    //MARK: - Methods
    
    // Method to calculate the BMI based on user's height and weight
    mutating func calculateBMI(userHeight: Float, userWeight: Float) {
        let heightInMeters = userHeight / 100   // Change CM to M
        let bmiValue = userWeight / (heightInMeters * heightInMeters) // Formula: Weight (KG) / Height (M)^2
        
        // Get the BMI classification
        if bmiValue < 18.5 {
            bmi = BMI(
                value: bmiValue,
                classification: .underweight,
                advice: "You are underweight and may need to put on some weight. Please consult a medical professional for advice.",
                color: C.classificationColors.underweight,
                height: userHeight,
                weight: userWeight
            )
        } else if bmiValue < 25 {
            self.bmi = BMI(
                value: bmiValue,
                classification: .normal,
                advice: "Your weight is healthy for your height. You can maintain your current calorie intake and activity level.",
                color: C.classificationColors.normal,
                height: userHeight,
                weight: userWeight
            )
        } else if bmiValue < 30 {
            bmi = BMI(
                value: bmiValue,
                classification: .overweight,
                advice: "You are slightly overweight. You are advised to lose some weight and consult a medical professional for advice.",
                color: C.classificationColors.overweight,
                height: userHeight,
                weight: userWeight
            )
        } else if bmiValue < 40 {
            bmi = BMI(
                value: bmiValue,
                classification: .obese,
                advice: "You are heavily overweight. If you do not lose weight, it may cause health issues. It is recommended to consult a medical professional for advice.",
                color: C.classificationColors.obese,
                height: userHeight,
                weight: userWeight
            )
        } else {
            bmi = BMI(
                value: bmiValue,
                classification: .extremelyObese,
                advice: "Your health is at risk. It is heavily recommended to consult a medical professional for advice on losing weight.",
                color: C.classificationColors.extremelyObese,
                height: userHeight,
                weight: userWeight
            )
        }
    }
    
    // Get the BMI Value
    func getBMIValue() -> Float {
        return bmi?.value ?? 0
    }
    
    // Get the BMI Classification
    func getBMIClassification() -> weightClassifications {
        return bmi?.classification ?? .unknownError
    }
    
    // Get the BMI Advice
    func getBMIAdvice() -> String {
        return bmi?.advice ?? "No BMI Found"
    }
    
    // Get the BMI Color
    func getBMIColor() -> Color {
        return bmi?.color ?? Color.purple
    }
    
    // Get the arrow spacing
    func getArrowSpacing(width: CGFloat) -> CGFloat {
        let value = CGFloat(getBMIValue())
        let spacing = width * (value / 45)
        return spacing
    }
    
    // Get BMI Classification as string
    func getBMIClassificationString() -> String {
        let classification = bmi?.classification ?? .unknownError
        
        switch classification {
        case .underweight:
            return "Underweight"
        case .normal:
            return "Healthy"
        case .overweight:
            return "Overweight"
        case .obese:
            return "Obese"
        case .extremelyObese:
            return "Extremely Obese"
        default:
            return "Unknown"
        }
    }
}
