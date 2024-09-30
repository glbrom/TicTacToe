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
                
                GreyIconButtonView()
                
                VStack(spacing: 20) {
                    Text("Select Game")
                        .font(.system(size: 24, weight: .medium))
                    NavigationLink(destination: OnboardingView()) {
                        GreyButtonView(buttonTitle: "Single Player", icon: "Single-Player-Icon")
                    }
                    NavigationLink(destination: OnboardingView()) {
                        GreyButtonView(buttonTitle: "Two Players", icon: "Two-Players-Icon-2")
                    }
                }
            }
            .toolbar() {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: OnboardingView()) {
                        Image(systemName: "flame.fill")
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
