//
//  LeaderboardView.swift
//  TicTacToe
//
//  Created by Serge Eliseev on 02.10.2024.
//
import SwiftUI

struct LeaderboardView: View {
    @State private var startGameTime = true //Переключатель прохождения игры
    
    var body: some View {
        NavigationView {
            VStack {
                if startGameTime {
                    LeaderboardTimeResult(number: 1)
                } else {
                    LeaderboardNoGame()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Spacer()
                        Button(action: {
                        }) {
                            Image(systemName: "arrow.left")
                                .font(.system(size: 23, weight: .bold))
                                .foregroundStyle(.appBlack)
                        }

                        Text("Leaderboard")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(65)
                    }
                }
            }
        }
    }
}

#Preview {
    LeaderboardView()
}
