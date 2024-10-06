//
//  SinglePlayViewModel.swift
//  TicTacToe
//
//  Created by Roman Golub on 03.10.2024.
//

import SwiftUI

final class SinglePlayViewModel: ObservableObject {
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @Published var selectedLevel: DifficultyLevel = .easy
    
    @Published var moves: [SinglePlayModel.Move?] = Array(repeating: nil, count: 9)
    @Published var isGameboardDisabled = false
    @Published var currentTurn: SinglePlayModel.Player = .human
    @Published var isGameStarted = false
    
    // Add icon with SettingGame
    @Published var humanIcon = SettingGameViewModel().items.first { $0.isPicked }?.imageNames[0] ?? "Xskin1"
    @Published var computerIcon = SettingGameViewModel().items.first { $0.isPicked }?.imageNames[1] ?? "Oskin1"
    
    // Timer
    @Published var timerViewModel = TimerViewModel()
    
    // ResultView icon and text
    @Published var isGameOver: Bool = false
    @Published var gameResultText: String = ""
    @Published var resultIcon: String = ""
    
    init(selectedLevel: DifficultyLevel = .easy) {
        self.selectedLevel = selectedLevel
    }
    
    // Process player's move
    func processPlayerMove(for position: Int) {
        guard !isSquareOccupied(in: moves, forIndex: position) else { return }
        // Processing human player move
        moves[position] = SinglePlayModel.Move(player: .human, boardIndex: position, humanIcon: humanIcon, computerIcon: computerIcon)
        //        checkForGameResult(for: .human)
        
        if checkForGameResult(for: .human) {
            return
        }
        
        //        currentTurn = .computer
        
        // Computer move
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard let self = self, !self.isGameboardDisabled else { return }
            
            DispatchQueue.main.async {
                self.isGameboardDisabled = true
                
                let computerPosition = self.determineComputerMovePosistion(in: self.moves)
                self.moves[computerPosition] = SinglePlayModel.Move(player: .computer, boardIndex: computerPosition, humanIcon: self.humanIcon, computerIcon: self.computerIcon)
                //                self.checkForGameResult(for: .computer)
                if self.checkForGameResult(for: .computer) {
                    return // Exit if the game is over
                }
                self.isGameboardDisabled = false
            }
        }
    }
    
    // Check for win or draw
    func checkForGameResult(for player: SinglePlayModel.Player) -> Bool {
        if checkWinCondition(for: player, in: moves) {
            // "Human wins"
            if player == .human {
                gameResultText = "Player One wins!"
                resultIcon = "Win-Icon"
            } else {
                // "Computer wins"
                gameResultText = "You Lose!"
                resultIcon = "Lose-Icon"
            }
            timerViewModel.stopTimer()
            timerViewModel.saveGameTime()
            isGameOver = true
            return true
            
        } else if checkForDrawCondition(in: moves) {
            // "It's a Draw!"
            gameResultText = "Draw!"
            resultIcon = "Draw-Icon"
            timerViewModel.stopTimer()
            isGameOver = true
            return true
        }
        currentTurn = player == .human ? .computer : .human
        
        return false
    }
    
    
    func isSquareOccupied(in moves: [SinglePlayModel.Move?], forIndex index: Int) -> Bool {
        return moves.contains(where: { $0?.boardIndex == index })
    }
    
    func determineComputerMovePosistion(in moves: [SinglePlayModel.Move?]) -> Int {
        
        let logicModel = GameLogicModel(currentMove: moves)
        let winPatterns: Set<Set<Int>> = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        
        func easyMode() -> Int {
            // Pick a random square
            logicModel.pickRandomSquare()
        }
        
        func hardMode() -> Int {
            // Try block possible player win
            let blockPossibleWin = logicModel.blockWin(patterns: winPatterns)
            if (blockPossibleWin != -1) { return blockPossibleWin }
            
            // If there's no win to be blocked, then pick the middle square
            let middleSquare = logicModel.pickMiddleSquare()
            if (middleSquare != -1) { return middleSquare }
            
            // If AI can't pick middle square, then pick a random square
            return easyMode()
        }
        
        func standartMode() -> Int {
            // If AI can win, then win the game
            let winGame = logicModel.winGame(patterns: winPatterns)
            if (winGame != -1) { return winGame }
            
            // If AI can't win the game, then block a possible win
            return hardMode()
        }
        
        switch selectedLevel {
        case .easy:
            return easyMode()
        case .standard:
            return standartMode()
        case .hard:
            return hardMode()
        }
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
        timerViewModel.stopTimer()
    }
    
}
