//
//  GreyIconButtonView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

struct GreyIconButtonView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: 285, height: 246)
                .shadow(color: .appLightBlue, radius: 10)
        }
    }
}

#Preview {
    GreyIconButtonView()
}
