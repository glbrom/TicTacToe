//
//  GameBoardView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

struct GameBoardView: View {
    var playerIconIndicator: String
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                ZStack {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(0..<9) { item in
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.appLightBlue)
                                    .cornerRadius(20)
                                    .frame(
                                        width: geometry.size.width / 3 - 20,
                                        height: geometry.size.width / 3 - 20
                                    )
                                
                                Image(playerIconIndicator)
                                    .resizable()
                                    .frame(width: 54, height: 54)
                            }
                        }
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    GameBoardView(playerIconIndicator: "Xskin1")
}
