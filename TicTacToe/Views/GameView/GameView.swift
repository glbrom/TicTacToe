//
//  GameView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

struct GameView: View {
    @State private var isShowGameTime: Bool = true
    @State private var playerOne = "You"
    @State private var playerTwo = "Player Two"
    
    var body: some View {
        VStack {
            // Back button view
            HStack {
                Button(action: {
                    
                }) {
                    Image("Back-Icon")
                        .padding(.horizontal, 20)
                }
                Spacer()
            }
            
            // PlayerView and Timer on/off
            HStack(alignment: .center) {
                PlayerView(playerIcon: "Xskin1", playerName: playerOne)
                Spacer()
                
                Text("1:59")
                    .font(.system(size: 20, weight: .bold))
                    .opacity(isShowGameTime ? 1 : 0)
                
                Spacer()
                PlayerView(playerIcon: "Oskin1", playerName: playerTwo)
            }
            .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 30))
            
            // Players Turn and icon
            HStack(spacing: 10) {
                if isShowGameTime {
                    Image("Oskin1")
                }
                
                Text("\(playerTwo) turn")
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 160, height: 24, alignment: .top)
            }
            .frame(width: 220, height: 60)
            .padding(EdgeInsets(top: 30, leading: 85, bottom: 30, trailing: 85))
            
            // GameBoardView
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    .shadow(color: Color.appGrey.opacity(0.3), radius: 15, x: 4, y: 4)
                    .overlay {
                        GameBoardView()
                            .padding(15)
                    }
                    .frame(width: 300, height: 300)
                
            }
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
            
            Spacer()
        }
        .background(.appBackground)
    }
    
}

#Preview {
    GameView()
}
