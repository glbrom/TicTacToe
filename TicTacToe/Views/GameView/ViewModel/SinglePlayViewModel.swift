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
    
    @Published var selectedLevel: DifficultyLevel = .easy
    
    @Published var moves: [SinglePlayModel.Move?] = Array(repeating: nil, count: 9)
    @Published var isGameboardDisabled = false
    @Published var currentTurn: SinglePlayModel.Player = .human
    //    @Published var selectedLevelIndex = 0
    @Published var isGameStarted = false
    
    // Timer
    @Published var gameDuration: Int = 0
    @Published var remainingTime: Int = 30
    private var timer: Timer?
    
    @Published var isTimerVisible: Bool = true
    @Published var selectedTimerDuration: Int = 60 // time 30 60 120 sec
    
    private var totalTimeInSeconds: Int {
        selectedTimerDuration
    }
    
    // ResultView icon and text
    @Published var isGameOver: Bool = false
    @Published var gameResultText: String = ""
    @Published var resultIcon: String = ""
    
    var formattedTime: String {
        let minutes = remainingTime / 60
        let seconds = remainingTime % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    init(selectedLevel: DifficultyLevel = .easy) {
        self.selectedLevel = selectedLevel
    }
    
    func processPlayerMove(for position: Int) {
        guard !isSquareOccupied(in: moves, forIndex: position) else { return }
        
        // Processing human player move
        moves[position] = SinglePlayModel.Move(player: .human, boardIndex: position)
        //        checkForGameResult(for: .human)
        
        if checkForGameResult(for: .human) {
            return
        }
        
        // Computer move
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard let self = self, !self.isGameboardDisabled else { return }
            
            DispatchQueue.main.async {
                self.isGameboardDisabled = true
                
                let computerPosition = self.determineComputerMovePosistion(in: self.moves)
                self.moves[computerPosition] = SinglePlayModel.Move(player: .computer, boardIndex: computerPosition)
                //                self.checkForGameResult(for: .computer)
                if self.checkForGameResult(for: .computer) {
                    return // Exit if the game is over
                }
                self.isGameboardDisabled = false
            }
        }
    }
    
    func checkForGameResult(for player: SinglePlayModel.Player) -> Bool {
        if checkWinCondition(for: player, in: moves) {
            // "Human wins"
            if player == .human {
                // "You Win"
                gameResultText = "Player One wins!"
                resultIcon = "Win-Icon"
            } else {
                // "Computer wins"
                gameResultText = "You Lose!"
                resultIcon = "Lose-Icon"
            }
            stopTimer()
            saveBestTime()
            isGameOver = true
            return true
            
        } else if checkForDrawCondition(in: moves) {
            // "It's a Draw!"
            gameResultText = "Draw!"
            resultIcon = "Draw-Icon"
            stopTimer()
            saveBestTime()
            isGameOver = true
            return true
        }
        //        currentTurn = player == .human ? .computer : .human
        
        return false
    }
    
    
    func isSquareOccupied(in moves: [SinglePlayModel.Move?], forIndex index: Int) -> Bool {
        return moves.contains(where: { $0?.boardIndex == index })
    }
    
    func determineComputerMovePosistion(in moves: [SinglePlayModel.Move?]) -> Int {
        
        let logicModel = GameLogicModel(currentMove: moves)
        let winPatterns: Set<Set<Int>> = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        
        //        var movePosition: Int = 0
        
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
        
        //                func hardMode() -> Int {
        //                    // If AI can win, then win the game
        //                    let winGame = logicModel.winGame(patterns: winPatterns)
        //                    if (winGame != -1) { return winGame }
        //        
        //                    // If AI can't win the game, then block a possible win
        //                    let blockPossibleWin = logicModel.blockWin(patterns: winPatterns)
        //                    if (blockPossibleWin != -1) { return blockPossibleWin }
        //        
        //                    // If there's no win to be blocked, then pick the middle square
        //                    let middleSquare = logicModel.pickMiddleSquare()
        //                    if (middleSquare != -1) { return middleSquare }
        //        
        //                    // If AI can't pick middle square because is yours, then pick a square above the middle
        //                    let secondSquare = logicModel.pickMiddleSquare()
        //                    if (secondSquare != -1) { return secondSquare }
        //        
        //                    // If AI can't pick middle square because is not yours, then pick a corner square
        //                    let cornerSquare = logicModel.pickCornerSquare()
        //                    if (cornerSquare != -1) { return cornerSquare }
        //        
        //                    // If AI can't pick corner square, then pick a random square
        //                    return easyMode()
        //                }
        switch selectedLevel {
        case .easy:
            return easyMode()
        case .standard:
            return standartMode()
        case .hard:
            return hardMode()
            
        }
        
        //        switch(selectedLevelIndex) {
        //        case 0:
        //            movePosition = easyMode()
        //        case 1:
        //            movePosition = standartMode()
        //        case 2:
        //            movePosition = hardMode()
        //            //        case 3:
        //            //            movePosition = impossibleMode()
        //        default:
        //            print("Something is wrong")
        //        }
        //        
        //        return movePosition
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
        stopTimer()
    }
    
    // Timer
    func startTimer() {
        remainingTime = totalTimeInSeconds
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.remainingTime > 0 {
                self.remainingTime -= 1
            } else {
                self.timer?.invalidate()
                self.endGame()
            }
        }
    }
    
    func endGame() {
        print("Game Over. Remaining time: \(remainingTime) seconds")
    }
    
    func saveBestTime() {
        let bestTime = UserDefaults.standard.integer(forKey: "BestTime")
        if gameDuration < bestTime || bestTime == 0 {
            UserDefaults.standard.set(gameDuration, forKey: "BestTime")
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        gameDuration = 1800 - remainingTime
    }
    
    deinit {
        timer?.invalidate()
    }
    
}
