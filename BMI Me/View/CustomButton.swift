//
//  CustomButton.swift
//  BMI Me
//
//  Created by Jonathan Vieri on 11/08/22.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var buttonColor: Color
    var textColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 100)
                .frame(width: 300, height: 80)
                .foregroundColor(buttonColor)
            
            Text(text)
                .font(.largeTitle)
                .bold()
                .foregroundColor(textColor)
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "Calculate BMI", buttonColor: Color.red, textColor: Color.white)
    }
}
