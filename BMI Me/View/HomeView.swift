        //
//  HomeView.swift
//  BMI Me
//
//  Created by Jonathan Vieri on 10/08/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            C.darkColors.backgroundColor
                .ignoresSafeArea(.all)
            
            Text("BMI Me")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
