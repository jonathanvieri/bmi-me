//
//  CalculateView.swift
//  BMI Me
//
//  Created by Jonathan Vieri on 10/08/22.
//

import SwiftUI

struct CalculateView: View {
    @State private var height: Float = 100
    
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                C.customColors.backgroundColor
                    .ignoresSafeArea(.all)
                
                VStack {
                    Spacer().frame(height: 30)
                    
                    // Height component
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: metrics.size.width * 0.90, height: metrics.size.height * 0.15)
                            .foregroundColor(C.customColors.boxColor)
                        
                        VStack {
                            Text("Height")
                            
                            Text("\(String(format: "%.0f", height)) CM")
                                .font(.system(.title2, design: .rounded))
                                .foregroundColor(.white)
                            
                            Slider(value: $height, in: 50...250)
                                .frame(width: metrics.size.width * 0.85)
                        }
                    }
                    
                    Spacer()
                    
                    CustomButton(text: "Calculate", buttonColor: C.customColors.buttonColor, textColor: C.customColors.textColor)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("BMI Calculator")
                        .font(.largeTitle.bold())
                        .accessibilityAddTraits(.isHeader)
                        .foregroundColor(C.customColors.textColor)
                }
            }
        }
    }
}

struct CalculateView_Previews: PreviewProvider {
    static var previews: some View {
        CalculateView()
    }
}
