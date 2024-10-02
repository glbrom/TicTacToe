//
//  PlayerView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

struct PlayerView: View {
    var playerIcon: String
    var playerName: String
    
    var body: some View {
        VStack {
            
            VStack {
                Image(playerIcon)
                .frame(width: 54, height: 54)
                
                Text(playerName)
                .font(.system(size: 16, weight: .semibold))
                .frame(width: 83, height: 20, alignment: .top)
            }
               
        }
        .frame(width: 100, height: 100)
        .padding(10)
        .background(Color.appLightBlue)
        .cornerRadius(30)
    }
}

#Preview {
    PlayerView(playerIcon: "Xskin1", playerName: "You")
}
