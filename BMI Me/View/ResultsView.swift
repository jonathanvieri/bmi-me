//
//  ResultsView.swift
//  BMI Me
//
//  Created by Jonathan Vieri on 10/08/22.
//

import SwiftUI

struct ResultsView: View {
    @State var bmi: CalculatorManager
    
    var body: some View {
        
        ZStack {
            C.customColors.backgroundColor
                .ignoresSafeArea(.all)
            
            VStack {
                Text("BMI: \(bmi.getBMIValue())")
                    .foregroundColor(.white)
                    .font(.title2.bold())
                
                Text("Advice: \(bmi.getBMIAdvice())")
                    .foregroundColor(.white)
                    .font(.title2.bold())
            }
            
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(bmi: CalculatorManager(height: 170, weight: 50))
    }
}
