//
//  GreyButtonView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//


import SwiftUI

struct GreyButtonView: View {
    
    var buttonTitle: String
    var icon: String?
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
//                    .fill(.appLightBlue)
                HStack(alignment: .center) {
                    Image(icon ?? "")
                    Text(buttonTitle)
//                        .foregroundStyle(.appBlack)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .padding(8)
                }
            }

            .font(.system(size: 20, weight: .medium))
        })
    }
}

#Preview {
    GreyButtonView(buttonTitle: "Single Player", icon: "Single-Player-Icon", action: {})
        .frame(width: 244, height: 68)
    
}

