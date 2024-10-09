//
//  SettingLabelView.swift
//  TicTacToe
//
//  Created by Руслан on 2.10.2024.
//

import SwiftUI

struct SettingLabelView: View {
    var title: String
    @Binding var toggle: Bool
    
    var body: some View {
        HStack {
            Text(title)
                .multilineTextAlignment(.center)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.appBlack)
            
            Spacer()
            
            Toggle("", isOn: $toggle)
                .tint(Color.appBlue)
            
        }
        .padding(.all, 20)
        .background(Color.appLightBlue)
        .cornerRadius(30)
    }
}
