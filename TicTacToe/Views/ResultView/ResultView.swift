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
        NavigationView {
            VStack {
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
                    NavigationLink(destination: GameView()) {
                        Text("Play Again").customText(isFilled: true)
                    }
                    NavigationLink(destination: SelectGameView()) {
                        Text("Back").customText(isFilled: false)
                    }
                }
                .padding(21)
            }
        }
    }
}

#Preview {
    ResultView(
        text: "Player One win!",
        icon: "Win-Icon"
    )
}
