//
//  LeaderboardNoGame.swift
//  TicTacToe
//
//  Created by Serge Eliseev on 03.10.2024.
//

import SwiftUI

struct LeaderboardNoGame: View {
    var body: some View {
        VStack {
            Spacer()
            
            Text("No game history with turn on time")
                .font(.title2)
                .padding(.horizontal, 120)
            
            
            Image("Isolation_Mode-2")
                .padding(30)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LeaderboardNoGame()
}
