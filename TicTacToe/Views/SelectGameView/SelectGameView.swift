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
                   
                    GreyButtonView(buttonTitle: "Single Player", icon: "Single-Player-Icon")
                    
                    GreyButtonView(buttonTitle: "Two Players", icon: "Single-Player-Icon")
                }
            }
        }
    }
}

#Preview {
    SelectGameView()
}
