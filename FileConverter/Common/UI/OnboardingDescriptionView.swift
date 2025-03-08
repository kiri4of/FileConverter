//
//  OnboardingDescriptionView.swift
//  FileConverter
//
//  Created by Kiri4of on 08/03/2025.
//

import SwiftUI

struct OnboardingDescriptionView: View {
    let titleBluePart: String
    let titleBlackPart: String
    let firstLine: String
    let secondLine: String
    
    var body: some View {
        VStack {
            Text(titleBluePart)
                .font(.system(size: 35, weight: .bold))
                .foregroundStyle(Color(AppColor.lightBlue))
            
            Text(titleBlackPart)
                .font(.system(size: 35, weight: .bold))
                .foregroundStyle(.black)
            
            VStack(spacing: 4) {
                Text(firstLine)
                    .foregroundColor(.secondary)
                    .font(.system(size: 16, weight: .medium))
                
                Text(secondLine)
                    .foregroundColor(.secondary)
                    .font(.system(size: 16, weight: .medium))
            }
        }
        .padding()
    }
}

#Preview {
    OnboardingDescriptionView(
        titleBluePart: "Your Ultimate ",
        titleBlackPart: "PDF Editing Tool",
        firstLine: "Modify text, add sign, annotate",
        secondLine: "and more – all in one app")
}
//
