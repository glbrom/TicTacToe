//
//  CustomGreyButtonModifier.swift
//  TicTacToe
//
//  Created by Sergey Zakurakin on 10/2/24.
//

import SwiftUICore

struct CustomGreyButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
        .foregroundStyle(.black)
        .font(.system(size: 20, weight: .medium))
        .padding(.horizontal, 42)
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity, alignment: .center)
        .background(.appGrey)
        .cornerRadius(30)
    }
}

extension View {
    func customGrey() -> some View {
        modifier(CustomGreyButtonModifier())
    }
}

