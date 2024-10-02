//
//  ButtonView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

struct ButtonView: View {
    
    var buttonTitle: String
    var isFilled: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(buttonTitle)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(isFilled ? .white : .appBlue)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 10)
                .padding(.vertical, 24)
                .background(isFilled ? .appBlue : .clear)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .overlay {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(.appBlue, lineWidth: 2)
                }
        }
    }
}

#Preview {
    ButtonView(buttonTitle: "Picked", isFilled: true, action: {})
}

