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
                    
                    NavigationLink(destination: SelectGameView()) {
                        PurpleButtonView(buttonTitle: "Let's Play")
                    }
                    .padding(.vertical, 40)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: SelectGameView()) {
                        Image(systemName: "flame.fill")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: SelectGameView()) {
                        Image(systemName: "flame.fill")
                    }
                }
            }
            
        }
    }
}

#Preview {
    OnboardingView()
}
