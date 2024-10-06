//
//  SinglePlayModel.swift
//  TicTacToe
//
//  Created by Roman Golub on 03.10.2024.
//

import Foundation

struct SinglePlayModel {
    enum Player {
        case human, computer
        
    }
    
    struct Move {
        let player: Player
        let boardIndex: Int
        let humanIcon: String
        let computerIcon: String
        
        var indicator: String {
            return player == .human ? humanIcon : computerIcon
        }
    }
}
