//
//  SinglePlayViewModel.swift
//  TicTacToe
//
//  Created by Roman Golub on 03.10.2024.
//

import SwiftUI

final class SinglePlayViewModel: ObservableObject {
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let levels: [String] = ["Easy", "Standart", "Hard"]
    
    @Published var moves: [SinglePlayModel.Move?] = Array(repeating: nil, count: 9)
    @Published var isGameboardDisabled = false
    @Published var currentTurn: SinglePlayModel.Player = .human
    @Published var selectedLevelIndex = 0
    @Published var isGameStarted = false
    
    func processPlayerMove(for position: Int) {
        guard !isSquareOccupied(in: moves, forIndex: position) else { return }
        
        // Processing human player move
        moves[position] = SinglePlayModel.Move(player: .human, boardIndex: position)
        checkForGameResult(for: .human)
        
        // Computer move
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            guard !isGameboardDisabled else { return }
            
            isGameboardDisabled = true
            let computerPosition = determineComputerMovePosistion(in: moves)
            moves[computerPosition] = SinglePlayModel.Move(player: .computer, boardIndex: computerPosition)
            checkForGameResult(for: .computer)
            
            isGameboardDisabled = false
        }
    }
    
    func checkForGameResult(for player: SinglePlayModel.Player) {
        if checkWinCondition(for: player, in: moves) {
            // "Human wins"
            if player == .human {
                // "You Win"
            } else {
                // "Computer wins"
            }
            
        } else if checkForDrawCondition(in: moves) {
            // "It's a Draw!"
            
        }
        currentTurn = player == .human ? .computer : .human
    }
    
    
    func isSquareOccupied(in moves: [SinglePlayModel.Move?], forIndex index: Int) -> Bool {
        return moves.contains(where: { $0?.boardIndex == index })
    }
    
    func determineComputerMovePosistion(in moves: [SinglePlayModel.Move?]) -> Int {
        
        let logicModel = GameLogicModel(currentMove: moves)
        let winPatterns: Set<Set<Int>> = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        
        var movePosition: Int = 0
        
        func easyMode() -> Int {
            // Pick a random square
            logicModel.pickRandomSquare()
        }
        
        func standartMode() -> Int {
            // Try block possible player win
            let blockPossibleWin = logicModel.blockWin(patterns: winPatterns)
            if (blockPossibleWin != -1) { return blockPossibleWin }
            
            // If there's no win to be blocked, then pick the middle square
            let middleSquare = logicModel.pickMiddleSquare()
            if (middleSquare != -1) { return middleSquare }
            
            // If AI can't pick middle square, then pick a random square
            return easyMode()
        }
        
        func hardMode() -> Int {
            // If AI can win, then win the game
            let winGame = logicModel.winGame(patterns: winPatterns)
            if (winGame != -1) { return winGame }
            
            // If AI can't win the game, then block a possible win
            return standartMode()
        }
        
        //        func impossibleMode() -> Int {
        //            // If AI can win, then win the game
        //            let winGame = logicModel.winGame(patterns: winPatterns)
        //            if (winGame != -1) { return winGame }
        //
        //            // If AI can't win the game, then block a possible win
        //            let blockPossibleWin = logicModel.blockWin(patterns: winPatterns)
        //            if (blockPossibleWin != -1) { return blockPossibleWin }
        //
        //            // If there's no win to be blocked, then pick the middle square
        //            let middleSquare = logicModel.pickMiddleSquare()
        //            if (middleSquare != -1) { return middleSquare }
        //
        //            // If AI can't pick middle square because is yours, then pick a square above the middle
        //            let secondSquare = logicModel.pickMiddleSquare()
        //            if (secondSquare != -1) { return secondSquare }
        //
        //            // If AI can't pick middle square because is not yours, then pick a corner square
        //            let cornerSquare = logicModel.pickCornerSquare()
        //            if (cornerSquare != -1) { return cornerSquare }
        //
        //            // If AI can't pick corner square, then pick a random square
        //            return easyMode()
        //        }
        
        switch(selectedLevelIndex) {
        case 0:
            movePosition = easyMode()
        case 1:
            movePosition = standartMode()
        case 2:
            movePosition = hardMode()
//        case 3:
//            movePosition = impossibleMode()
        default:
            print("Something is wrong")
        }
        
        return movePosition
    }
    
    func checkWinCondition(for player: SinglePlayModel.Player, in moves: [SinglePlayModel.Move?]) -> Bool {
        // Setting Win conditions
        let winPatterns: Set<Set<Int>> = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        
        let playerMoves = moves.compactMap { $0 }.filter { $0.player == player }
        let playerPositions = Set(playerMoves.map { $0.boardIndex })
        
        // If player move == a win condition, then win
        for pattern in winPatterns where pattern.isSubset(of: playerPositions) { return true }
        
        return false
    }
    
    func checkForDrawCondition(in moves: [SinglePlayModel.Move?]) -> Bool {
        // If all squares occupied, then draw
        return moves.compactMap { $0 }.count == 9
    }
    
    func resetGame() {
        moves = Array(repeating: nil, count: 9)
        isGameStarted = false
        currentTurn = .human
    }
}
