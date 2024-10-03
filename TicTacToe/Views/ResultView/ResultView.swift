//
//  ResultView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

struct ResultView: View {
    var text = "Player One win!"
    var icon = "Win-Icon"
    
    var body: some View {
        Spacer()
        
        VStack(spacing: 20) {
            Text(text)
                .font(.system(size: 20, weight: .bold))
            
            Image(icon)
                .frame(width: 228, height: 228)
                .background(Circle().foregroundStyle(.appBlue))
        }
        
        Spacer()
        
        VStack(spacing: 12) {
            ButtonView(buttonTitle: "Play Again", isFilled: true, action: {})
            ButtonView(buttonTitle: "Back", isFilled: false, action: {})
        }
        .padding(21)
    }
}

#Preview {
    ResultView()
}
