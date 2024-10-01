//
//  PurpleButtonView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

struct PurpleButtonView: View {
    
    var buttonTitle: String
    var color: Color
    var action: () -> Void
    
    var body: some View {
        
        
        Button (action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(color)
                
                Text(buttonTitle)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 30)
                
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .semibold))
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    .allowsTightening(true)
                
            }
            .background(color)
            .cornerRadius(30)
        }
    }
}

#Preview {
    PurpleButtonView(buttonTitle: "Picked", color: .appBlue, action: {})
        .frame(width: 348, height: 72)
    }

