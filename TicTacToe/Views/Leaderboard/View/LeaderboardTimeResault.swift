//
//  LeaderboardTimeResult.swift
//  TicTacToe
//
//  Created by Serge Eliseev on 03.10.2024.
//

import SwiftUI

struct LeaderboardTimeResult: View {
    var gameTimes: [String]
    
    var sortedGameTimes: [String] {
        gameTimes.sorted()
    }
    
    var body: some View {
        ScrollView {
            ForEach(sortedGameTimes.indices, id: \.self) { index in
                HStack {
                    Image(systemName: "\(index + 1).circle.fill")
                        .font(.system(size: 69, weight: .thin))
                        .foregroundStyle(.appBlack, index == 0 ? .appPurple : .appLightBlue)
                    
                    // Формируем текст в зависимости от позиции
                    let labelText: String = index == 0
                        ? "Best time \(sortedGameTimes[index])"
                        : "Time \(sortedGameTimes[index])"
                    
                    Text(labelText)
                        .padding(.leading, 25)
                        .frame(maxWidth: 269, maxHeight: 69, alignment: .leading)
                        .font(.title2.weight(.light))
                        .background(index == 0 ? .appPurple : .appLightBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 35))
                }
            }
        }
    }
}

#Preview {
    LeaderboardTimeResult(gameTimes: [])
}
