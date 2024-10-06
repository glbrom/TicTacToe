//
//  SelectGame2View.swift
//  TicTacToe
//
//  Created by Sergey Zakurakin on 10/4/24.
//

import SwiftUI

struct SelectGame2View: View {
    //MARK: - Private Properties
    @Environment(\.dismiss) private var dismiss
    @StateObject private var selectLevel = SelectLevelViewModel()
    
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
                        
                        // Buttons
                        selectLevel.difficultyButton(
                            difficulty: "Easy",
                            destination: GameViewComputerTest(
                                selectedDifficulty: .easy
                            )
                        )
                        
                        selectLevel.difficultyButton(
                            difficulty: "Medium",
                            destination: GameViewComputerTest(
                                selectedDifficulty: .standard
                            )
                        )
                        
                        selectLevel.difficultyButton(
                            difficulty: "Hard",
                            destination: GameViewComputerTest(
                                selectedDifficulty: .hard
                            )
                        )
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
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image("Back-Icon")
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    SelectGame2View()
}
