//
//  PurpleButtonView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

struct PurpleButtonView: View {
    
    var buttonTitle: String
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.appBlue)
                   
                Text(buttonTitle)
                    .foregroundStyle(.white)
                    .font(.system(size: 24, weight: .medium))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .padding(10)
            }
            .frame(width: 348, height: 72)
    }
}

#Preview {
    PurpleButtonView(buttonTitle: "Let's play")
        
}
