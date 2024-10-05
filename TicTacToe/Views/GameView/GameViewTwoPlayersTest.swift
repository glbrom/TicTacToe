//
//  GameViewTwoPlayersTest.swift
//  TicTacToe
//
//  Created by Roman Golub on 03.10.2024.
//

import SwiftUI

struct GameViewTwoPlayersTest: View {
    
    @StateObject private var twoPlayersViewModel = TwoPlayersViewModel()
    @StateObject private var timerViewModel = TimerViewModel()

    @State private var playerOne = "You"
    @State private var playerTwo = "Player Two"
    @State private var shoowSelectGameView: Bool = false
    
    var body: some View {
        //        NavigationView {
        VStack {
            // Back button view
            HStack {
                //                    NavigationLink(destination: SelectGameView()) {
                //                                          Image("Back-Icon")
                //                                              .padding(.horizontal, 20)
                //                                      }
                Button(action: {
                    shoowSelectGameView = true
                }) {
                    Image("Back-Icon")
                        .padding(.horizontal, 20)
                }
                Spacer()
            }
            
            // PlayerView and Timer on/off
            HStack(alignment: .center) {
                PlayerView(playerIcon: twoPlayersViewModel.playerOneIcon, playerName: playerOne)
                Spacer()
                
                if timerViewModel.isTimerVisible {
                    Text(timerViewModel.formattedTime)
                        .font(.system(size: 20, weight: .bold))
                }
                
                Spacer()
                PlayerView(playerIcon: twoPlayersViewModel.playerTwoIcon, playerName: playerTwo)
            }
            .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 30))
            
            // Players Turn and icon
            HStack(spacing: 10) {
                if twoPlayersViewModel.currentTurn == .playerTwo {
                    Image(twoPlayersViewModel.playerTwoIcon)
                }
                
                Text(twoPlayersViewModel.isPlayerOneTurn ? "\(playerOne)r turn" : "\(playerTwo) turn")
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
                        GeometryReader { geometry in
                            VStack {
                                Spacer()
                                
                                ZStack {
                                    LazyVGrid(columns: twoPlayersViewModel.columns, spacing: 20) {
                                        ForEach(0..<9) { item in
                                            ZStack {
                                                Rectangle()
                                                    .foregroundColor(.appLightBlue)
                                                    .cornerRadius(20)
                                                    .frame(
                                                        width: geometry.size.width / 3 - 20,
                                                        height: geometry.size.width / 3 - 20
                                                    )
                                                
                                                Image(twoPlayersViewModel.moves[item]?.indicator ?? "")
                                                    .resizable()
                                                    .frame(width: 54, height: 54)
                                            }
                                            .onTapGesture {
                                                twoPlayersViewModel.processPlayerMove(for: item)
                                            }
                                        }
                                    }
                                }
                                
                                Spacer()
                            }
                        }
                        .padding(15)
                    }
                    .frame(width: 300, height: 300)
                
            }
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
            
            Spacer()
        }
        .background(.appBackground)
        .onAppear {
            timerViewModel.startTimer()
        }
        .fullScreenCover(isPresented: $twoPlayersViewModel.isGameOver) {
            ResultView(text: twoPlayersViewModel.gameResultText, icon: twoPlayersViewModel.resultIcon, gameMode: .multiplayer)
        }
        .fullScreenCover(isPresented: $shoowSelectGameView) {
            SelectGameView()
        }
        .navigationBarBackButtonHidden(true)
        //        }
    }
    
}

#Preview {
    GameViewTwoPlayersTest()
}
