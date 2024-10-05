//
//  SelectGameView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

struct SelectGameView: View {
    
    @State var isSinglePlayerPresented = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.appBackground
                    .ignoresSafeArea()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .shadow(color: .appLightBlue, radius: 15)
                    
                    VStack(spacing: 20) {
                        Text("Select Game")
                            .font(.system(size: 24, weight: .medium))
                        
                        Button(action: {
                            isSinglePlayerPresented.toggle()
                        }) {
                            HStack(alignment: .center) {
                                Image("Single-Player-Icon")
                                Text("Single Player")
                            }
                            .customGrey()
                        }
                        .fullScreenCover(isPresented: $isSinglePlayerPresented) {
                            SelectGame2View()
                        }
                        
                        
                        NavigationLink(destination: GameViewTwoPlayersTest()) {
                            HStack(alignment: .center) {
                                Image("Two-Players-Icon")
                                Text("Two Players")
                            }
                            .customGrey()
                        }
                        
                        NavigationLink(destination: LeaderboardView()) {
                            HStack(alignment: .center) {
                                Image("Two-Players-Icon-2")
                                Text("Leaderboard")
                            }
                            .customGrey()
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .frame(height: 336)
                .padding(.horizontal, 52)
            }
            .toolbar() {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: SettingGameView(model: SettingGameViewModel())) {
                        Image("Setting-Icon")
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SelectGameView()
}
