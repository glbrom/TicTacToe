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
    var gameMode: GameMode
    
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
                    if gameMode == .computer {
                        NavigationLink(destination: GameViewComputerTest(selectedDifficulty: .easy)) {
                            Text("Play Again").customText(isFilled: true)
                        }
                    } else if gameMode == .multiplayer {
                        NavigationLink(destination: GameViewTwoPlayersTest()) {
                            Text("Play Again").customText(isFilled: true)
                        }
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
    ResultView(text: "Player One win!", icon: "Win-Icon", gameMode: .computer)
}
