//
//  ResultView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

struct ResultView: View {
    private var text = "Player One win!"
    private var icon: String = "Win-Icon"
    
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
        
//        VStack(spacing: 12) {
//            PurpleButtonView(buttonTitle: "Play Again", action: {})
//                .frame(height: 72)
//            BackButtonView(action: {})
//        }
//        .padding(21)
    }
}

#Preview {
    ResultView()
}
