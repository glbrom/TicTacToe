//
//  GameViewTest.swift
//  TicTacToe
//
//  Created by Roman Golub on 03.10.2024.
//

import SwiftUI

struct GameViewComputerTest: View {
    
    @StateObject private var singlePlayerViewModel = SinglePlayViewModel()
    @StateObject private var timerViewModel = TimerViewModel()
    
    @State private var playerOne = "You"
    @State private var playerTwo = "Player Two"
    @State private var showSelectGameView: Bool = false
    
    init(selectedDifficulty: DifficultyLevel) {
        _singlePlayerViewModel = StateObject(wrappedValue: SinglePlayViewModel(selectedLevel: selectedDifficulty))
    }
    
    var body: some View {
        VStack {
            // Back button view
            HStack {
                Button(action: {
                    showSelectGameView = true
                }) {
                    Image("Back-Icon")
                        .padding(.horizontal, 20)
                }
                Spacer()
            }
            
            // PlayerView and Timer on/off
            HStack(alignment: .center) {
                PlayerView(playerIcon: singlePlayerViewModel.humanIcon, playerName: playerOne)
                Spacer()
                
                if timerViewModel.isTimerVisible {
                    Text(timerViewModel.formattedTime)
                        .font(.system(size: 20, weight: .bold))
                }
                
                Spacer()
                PlayerView(playerIcon: singlePlayerViewModel.computerIcon, playerName: playerTwo)
            }
            .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 30))
            
            // Players Turn and icon
            HStack(spacing: 10) {
                if singlePlayerViewModel.currentTurn == .computer {
                    Image(singlePlayerViewModel.computerIcon)
                }
                
                Text(singlePlayerViewModel.currentTurn == .human ? "\(playerOne)r turn" : "\(playerTwo) turn")
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
                                                    .resizable()
                                                    .frame(width: 54, height: 54)
                                            }
                                            .onTapGesture {
                                                if singlePlayerViewModel.currentTurn == .human {
                                                    singlePlayerViewModel.processPlayerMove(for: item)
                                                    
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                Spacer()
                            }
                            .disabled(singlePlayerViewModel.isGameboardDisabled)
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
        .fullScreenCover(isPresented: $singlePlayerViewModel.isGameOver) {
            ResultView(text: singlePlayerViewModel.gameResultText, icon: singlePlayerViewModel.resultIcon, gameMode: .computer)
        }
        .fullScreenCover(isPresented: $showSelectGameView) {
            SelectGameView()
        }
        
        .navigationBarBackButtonHidden(true)
    }
    
}


#Preview {
    GameViewComputerTest(selectedDifficulty: .standard)
}
