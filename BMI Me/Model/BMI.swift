//
//  BMI.swift
//  BMI Me
//
//  Created by Jonathan Vieri on 16/08/22.
//

import SwiftUI

struct BMI {
    let value: Float
    let classification: weightClassifications
    let advice: String
    let color: Color
    let height: Float
    let weight: Float
}

enum weightClassifications {
    case underweight
    case normal
    case overweight
    case obese
    case extremelyObese
    case unknownError
}
