//
//  BackButtonView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

struct BackButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Back")
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.appBlue)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 10)
                .padding(.vertical, 24)
                .overlay {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(.appBlue, lineWidth: 2)
                }
        }
    }
}

#Preview {
    BackButtonView(action: {})
}
