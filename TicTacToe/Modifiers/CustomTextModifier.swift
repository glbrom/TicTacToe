//
//  CustomTextModifier.swift
//  TicTacToe
//
//  Created by Vladimir Dmitriev on 02.10.24.
//

import Foundation
import SwiftUICore

struct CustomTextModifier: ViewModifier {
    var isFilled: Bool
    
    func body(content: Content) -> some View {
        content
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

extension View {
    func customText(isFilled: Bool) -> some View {
        modifier(CustomTextModifier(isFilled: isFilled))
    }
}
