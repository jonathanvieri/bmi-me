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
    @State private var showAlert = false
    @State private var showError = false
    
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                C.customColors.backgroundColor
                    .opacity(0.92)
                    .ignoresSafeArea(.all)
                
                VStack {
                    
                    // Dismiss sheet button
                    Group {
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
                        Spacer().frame(height: 50)
                    }
                    
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
                            .foregroundColor(bmi.getBMIColor())
                            .padding(.leading, bmi.getArrowSpacing(width: customWidth))
                            .frame(width: customWidth, alignment: .leading)
                    } else {
                        Image(systemName: "arrowtriangle.up.fill")
                            .foregroundColor(C.customColors.buttonColor)
                            .padding(.leading, customWidth)
                            .frame(width: customWidth, alignment: .leading)
                    }
                    
                    Spacer().frame(height: 15)
                    
                    // BMI Value component
                    VStack {
                        Text("BMI")
                            .font(.title2)
                            .foregroundColor(C.customColors.textColor)
                        
                        Text("\(String(format: "%.1f", bmi.getBMIValue()))")
                            .font(.system(size: 48).bold())
                            .foregroundColor(C.customColors.textColor)
                    }
                    
                    Spacer().frame(height: 20)
                    
                    // BMI Summary component
                    Group {
                        VStack(spacing: 30) {
                            Text("You are ")
                                .font(.title2)
                                .foregroundColor(C.customColors.textColor) +
                            
                            Text("\(bmi.getBMIClassificationString())")
                                .font(.title2.bold())
                                .foregroundColor(bmi.getBMIColor())
                            
                            // BMI Advice Component
                            Text("\(bmi.getBMIAdvice())")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.title3.weight(.medium))
                                .foregroundColor(C.customColors.textColor)
                                .frame(width: customWidth)
                        }
                        
                        Spacer().frame(height: 80)
                    }
                    
                    // Error message if value bigger than 45
                    if showError {
                        Text("Unable to save BMI higher than 45")
                            .foregroundColor(.white)
                            .font(.title3)
                            .transition(.scale)
                    }
                    
                    // Save result component
                    Button {
                        if bmi.getBMIValue() <= 45{
                            showAlert = true
                        } else {
                            withAnimation {
                                showError = true
                            }
                        }
                        
                    } label: {
                        CustomButton(text: "Save Result", buttonColor: C.customColors.buttonColor, textColor: C.customColors.textColor)
                    }
                    .alert("BMI Saved", isPresented: $showAlert) {
                        Button("Ok") {
                            dismiss()
                        }
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
