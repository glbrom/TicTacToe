//
//  LeaderboardTimeResault.swift
//  TicTacToe
//
//  Created by Serge Eliseev on 03.10.2024.
//



import SwiftUI

struct LeaderboardTimeResult: View {
    var number: Int
    var gameTimes: [String] = ["00:48", "00:20", "00:40", "00:42"] // Нужно настроить словарь который будет фиксировать время за которое игра пройдена. И нужно настроить сортировку от меньшего к большему.
 

    var body: some View {
        VStack {
            ForEach(0..<gameTimes.count) { index in
                HStack(alignment: .bottom) {
                    Image(systemName: "\(index + 1).circle.fill")
                        .font(.system(size: 69, weight: .thin))
                        //.foregroundStyle(index == 1 ? .appBlack, .appPurple : .appLightBlue)
                        .foregroundStyle(.appBlack, index == 0 ? .appPurple : .appLightBlue)

                        

                    Text("Best time \(gameTimes[index])")
                        .padding(.leading, 25)
                        .frame(maxWidth: 269, maxHeight: 69, alignment: .leading)
                        .font(.title2.weight(.light))
                        .background(index == 0 ? .appPurple : .appLightBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 35))
                }
            }
        }
        .padding(.vertical, 50)
        Spacer()
    }
}

#Preview {
    LeaderboardTimeResult(number: 1)
}
