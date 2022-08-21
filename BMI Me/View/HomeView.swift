//
//  HomeView.swift
//  BMI Me
//
//  Created by Jonathan Vieri on 10/08/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                C.customColors.backgroundColor
                    .ignoresSafeArea(.all)
                
                VStack {
                    Text("BMI \nMe")
                        .font(.system(size: 72))
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(C.customColors.textColor)
                    
                    Spacer()
                    
                    NavigationLink {
                        CalculateView()
                    } label: {
                        CustomButton(text: "Calculate BMI", buttonColor: C.customColors.buttonColor, textColor: C.customColors.textColor)
                    }
                    
                    Spacer().frame(height: 50)
                    
                    NavigationLink {
                        SavedResultsView()
                    } label: {
                        CustomButton(text: "View Results", buttonColor: C.customColors.buttonColor, textColor: C.customColors.textColor)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
