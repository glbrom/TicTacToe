//
//  SelectableView.swift
//  TicTacToe
//
//  Created by Руслан on 2.10.2024.
//

import SwiftUI

struct SelectableView: View {
    let item: SelectableItem
    let action: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                ForEach(item.imageNames, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
            }
            .padding()
                 
            Button( action: {
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                action()
            }) {
                Text(item.isPicked ? GameConfig.picked : GameConfig.choose)
                    .foregroundColor(item.isPicked ? .white : .black)
                    .padding(.horizontal, 30)
                    .padding([.top, .bottom], 10)
                    .background(item.isPicked ? Color.appBlue : Color.gray.opacity(0.2))
                    .cornerRadius(30)
                    
            }
            .padding(.bottom, 10)
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
        .padding()
    }
}

