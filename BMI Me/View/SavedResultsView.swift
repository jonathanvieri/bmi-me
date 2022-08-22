//
//  SavedResultsView.swift
//  BMI Me
//
//  Created by Jonathan Vieri on 20/08/22.
//

import SwiftUI

struct SavedResultsView: View {
    var body: some View {
        ZStack {
            C.customColors.backgroundColor
                .ignoresSafeArea(.all)
            
            VStack(spacing: 50) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .foregroundColor(C.customColors.buttonColor)
                
                Text("Feature is not available yet")
                    .font(.title.bold())
                    .foregroundColor(C.customColors.textColor)
            }
        }
    }
}

struct SavedResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedResultsView()
    }
}
