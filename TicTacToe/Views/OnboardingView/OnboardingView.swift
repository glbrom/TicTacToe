//
//  OnboardingView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var isActive = false
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color.appBackground
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    Spacer()
                    Image("OnboardingLabel")
                        .resizable()
                        .frame(width: 260, height: 135)
                    
                    Text("TIC-TAC-TOE")
                        .font(.system(size: 38, weight: .medium))
                    
                    Spacer()
                    
                    ButtonView(
                        buttonTitle: "Let's Play",
                        isFilled: true
                    ) {
                        isActive = true
                    }
                    .frame(width: 348, height: 72)
                    .padding(.vertical)
                    
                    .background(
                        NavigationLink(destination: SelectGameView(), isActive: $isActive) {
                        }
                    )
                    .padding(.vertical, 40)
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationLink(destination: RulesView()) {
                            Image("RulesIcon")
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: SettingGameView()) {
                            Image("Setting-Icon")
                        }
                    }
                }
            }
        }
    }
    
}

#Preview {
    OnboardingView()
}
