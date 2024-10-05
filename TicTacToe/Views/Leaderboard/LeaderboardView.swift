//
//  LeaderboardView.swift
//  TicTacToe
//
//  Created by Serge Eliseev on 02.10.2024.
//
import SwiftUI

struct LeaderboardView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var startGameTime = true //Переключатель прохождения игры
    
    var body: some View {
        VStack {
            if startGameTime {
                LeaderboardTimeResult()
                    .padding(.top, 50)
            } else {
                LeaderboardNoGame()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 23, weight: .bold))
                        .foregroundStyle(.appBlack)
                }
            }
            
            ToolbarItem(placement: .principal) {
                Text("Leaderboard")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(65)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LeaderboardView()
}
