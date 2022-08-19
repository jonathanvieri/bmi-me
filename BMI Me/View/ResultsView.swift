//
//  ResultsView.swift
//  BMI Me
//
//  Created by Jonathan Vieri on 10/08/22.
//

import SwiftUI

struct ResultsView: View {
    @Environment(\.dismiss) var dismiss
    @State var bmi: CalculatorManager
    
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                C.customColors.backgroundColor
                    .opacity(0.92)
                    .ignoresSafeArea(.all)
                
                VStack {
                    
                    // Dismiss sheet button
                    HStack {
                        Spacer()
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(C.customColors.buttonColor)
                                .frame(width: metrics.size.width * 0.10, height: metrics.size.height * 0.10)
                        }
                    }
                    .padding(.trailing, 20)
                    Spacer()
                    
                    // BMI Graph component
                    let customWidth = metrics.size.width / 1.3
                    let customHeight = metrics.size.height * 0.05
                    
                    ZStack(alignment: .leading){
                        Rectangle().frame(width: customWidth, height: customHeight)
                            .foregroundColor(C.classificationColors.extremelyObese)
                        
                        Rectangle().frame(width: customWidth * (41 / 45) , height: customHeight)
                            .foregroundColor(C.classificationColors.obese)
                        
                        Rectangle().frame(width: customWidth * (31 / 45), height: customHeight)
                            .foregroundColor(C.classificationColors.overweight)
                        
                        Rectangle().frame(width: customWidth * (26 / 45), height: customHeight)
                            .foregroundColor(C.classificationColors.normal)
                        
                        Rectangle().frame(width: customWidth * (19 / 45), height: customHeight)
                            .foregroundColor(C.classificationColors.underweight)
                    }
                    .cornerRadius(50)
                    .overlay {
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(C.customColors.boxColor, lineWidth: 5)
                    }
                    
                    // Arrow component (Points to the BMI Classification on the graph)
                    // Max BMI value for the graph is 45
                    // If its higher than 45, the arrow will stop at the end of the bar
                    if (bmi.getBMIValue() <= 45) {
                        Image(systemName: "arrowtriangle.up.fill")
                            .foregroundColor(C.customColors.buttonColor)
                            .padding(.leading, bmi.getArrowSpacing(width: customWidth))
                            .frame(width: customWidth, alignment: .leading)
                    } else {
                        Image(systemName: "arrowtriangle.up.fill")
                            .foregroundColor(C.customColors.buttonColor)
                            .padding(.leading, customWidth)
                            .frame(width: customWidth, alignment: .leading)
                    }
                    
                    Spacer().frame(height: 25)
                    
                    // BMI Value component
                    VStack {
                        Text("BMI")
                            .font(.title2)
                            .foregroundColor(C.customColors.textColor)
                        
                        Text("\(String(format: "%.1f", bmi.getBMIValue()))")
                            .font(.system(size: 48).bold())
                            .foregroundColor(C.customColors.textColor)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(bmi: CalculatorManager(height: 170, weight: 50))
    }
}
