//
//  CalculatorManager.swift
//  BMI Me
//
//  Created by Jonathan Vieri on 16/08/22.
//

import Foundation

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
                advice: "",
                color: .white,
                height: userHeight,
                weight: userWeight
            )
        } else if bmiValue < 25 {
            self.bmi = BMI(
                value: bmiValue,
                classification: .normal,
                advice: "You are healthy.",
                color: .white,
                height: userHeight,
                weight: userWeight
            )
        } else if bmiValue < 30 {
            bmi = BMI(
                value: bmiValue,
                classification: .overweight,
                advice: "",
                color: .white,
                height: userHeight,
                weight: userWeight
            )
        } else if bmiValue < 40 {
            bmi = BMI(
                value: bmiValue,
                classification: .obese,
                advice: "",
                color: .white,
                height: userHeight,
                weight: userWeight
            )
        } else {
            bmi = BMI(
                value: bmiValue,
                classification: .extremelyObese,
                advice: "",
                color: .white,
                height: userHeight,
                weight: userWeight
            )
        }
    }
    
    // Get the BMI Value
    func getBMIValue() -> Float {
        return bmi?.value ?? 0
    }
    
    // Get the BMI Advice
    func getBMIAdvice() -> String {
        return bmi?.advice ?? "No BMI Found"
    }

}
