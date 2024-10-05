//
//  Extension+View.swift
//  TicTacToe
//
//  Created by Руслан on 2.10.2024.
//

import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ hidden: Bool) -> some View {
        if hidden {
            EmptyView()
        } else {
            self
        }
    }
}
