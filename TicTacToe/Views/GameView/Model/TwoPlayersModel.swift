//
//  TwoPlayersModel.swift
//  TicTacToe
//
//  Created by Roman Golub on 03.10.2024.
//

import Foundation

struct TwoPlayersModel {
    enum Player {
        case playerOne, playerTwo
    }
    
    struct Move {
        let player: Player
        let boardIndex: Int
        
        var indicator: String {
            return player == .playerOne ? "Xskin1" : "Oskin1"
        }
    }
}
