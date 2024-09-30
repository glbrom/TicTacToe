//
//  OnboardingView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        
        NavigationView {
            VStack(spacing: 40) {
                Spacer()
                Image("OnboardingLabel")
                    .resizable()
                    .frame(width: 260, height: 135)
                
                Text("TIC-TAC-TOE")
                    .font(.system(size: 38, weight: .medium))
                
                Spacer()
                
                NavigationLink(destination: SelectGameView()) {
                    PurpleButtonView(buttonTitle: "Let's Play")
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
