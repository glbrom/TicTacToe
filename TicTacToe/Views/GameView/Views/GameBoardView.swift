//
//  GameBoardView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

struct GameBoardView: View {
    @StateObject private var singlePlayerViewModel = SinglePlayViewModel()
    @StateObject private var viewModel = TwoPlayersViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                ZStack {
                    LazyVGrid(columns: singlePlayerViewModel.columns, spacing: 20) {
                        ForEach(0..<9) { item in
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.appLightBlue)
                                    .cornerRadius(20)
                                    .frame(
                                        width: geometry.size.width / 3 - 20,
                                        height: geometry.size.width / 3 - 20
                                    )
                                
                                Image(singlePlayerViewModel.moves[item]?.indicator ?? "")
//                                Image(viewModel.moves[item]?.indicator ?? "")
                                    .resizable()
                                    .frame(width: 54, height: 54)
                            }
                            .onTapGesture {
                                singlePlayerViewModel.processPlayerMove(for: item)
//                                viewModel.processPlayerMove(for: item)
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .disabled(singlePlayerViewModel.isGameboardDisabled)
        }
    }
}

#Preview {
    GameBoardView()
}
