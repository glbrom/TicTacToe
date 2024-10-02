//
//  RulesView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

//  RulesView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

struct RulesView: View {
    
    let gameRules: [String] = [
        "Draw a grid with three rows and three columns, creating nine squares in total.",
        "Players take turns placing their marker (X or O) in an empty square. To make a move, a player selects a number corresponding to the square where they want to place their marker.",
        "Player X starts by choosing a square (e.g., square 5). Player O follows by choosing an empty square (e.g., square 1). Continue alternating turns until the game ends.",
        "The first player to align three of their markers horizontally, vertically, or diagonally wins. Examples of Winning Combinations: Horizontal: Squares 1, 2, 3 or 4, 5, 6 or 7, 8, 9 Vertical: Squares 1, 4, 7 or 2, 5, 8 or 3, 6, 9 Diagonal: Squares 1, 5, 9 or 3, 5,7."
        ]
    var body: some View {
        
        NavigationView {
            VStack {
                
                ScrollView {
                    ForEach(gameRules.indices, id: \.self) { rules in
                        RuleRowView(number: rules + 1, text: gameRules[rules])
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack {
                                Spacer()
                                Button(action: {
                                }) {
                                    Image(systemName: "arrow.left")
                                        .font(.system(size: 23, weight: .bold))
                                        .foregroundStyle(.black)
                                }

                                Text("How to play")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(65)
                            }
                        }
                    }
                }
                .padding(25)
            }
        }
    }
}


#Preview {
    RulesView()
}
