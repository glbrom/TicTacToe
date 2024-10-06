//
//  SelectLevelViewModel.swift
//  TicTacToe
//
//  Created by Sergey Zakurakin on 10/5/24.
//

import SwiftUI

class SelectLevelViewModel: ObservableObject {
    
    //MARK: - method for setting level difficulty 
    func difficultyButton<Destination: View>(difficulty: String, destination: Destination) -> some View {
        NavigationLink(destination: destination) {
            HStack(alignment: .center) {
                Text(difficulty)
            }
            .customGrey()
        }
    }
}
