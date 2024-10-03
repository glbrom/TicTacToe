//
//  SelectGameView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

struct SelectGameView: View {
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
                        
                        NavigationLink(destination: GameView()) {
                            HStack(alignment: .center) {
                                Image("Single-Player-Icon")
                                Text("Single Player")
                            }
                            .customGrey()
                        }
                        
                        NavigationLink(destination: GameView()) {
                            HStack(alignment: .center) {
                                Image("Two-Players-Icon")
                                Text("Two Players")
                            }
                            .customGrey()
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .frame(height: 246)
                .padding(.horizontal, 52)
            }
            .toolbar() {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: SettingGameView()) {
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
