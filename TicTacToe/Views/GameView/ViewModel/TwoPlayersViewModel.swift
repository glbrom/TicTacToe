//
//  TwoPlayersViewModel.swift
//  TicTacToe
//
//  Created by Roman Golub on 03.10.2024.
//

import SwiftUI

final class TwoPlayersViewModel: ObservableObject {
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var isPlayerOneTurn: Bool = true
    
    @Published var moves: [TwoPlayersModel.Move?] = Array(repeating: nil, count: 9)
    @Published var currentTurn: TwoPlayersModel.Player = .playerOne
    
    @Published var isGameOver: Bool = false
    @Published var gameResultText: String = ""
    @Published var resultIcon: String = ""
    
    // Timer
    @Published var gameDuration: Int = 0
    @Published var remainingTime: Int = 1800
    private var timer: Timer?
    
    @Published var isTimerVisible: Bool = true
    @Published var selectedTimerDuration: Int = 30
    
    private var totalTimeInSeconds: Int {
        selectedTimerDuration * 60
    }
    
    var formattedTime: String {
        let minutes = remainingTime / 60
        let seconds = remainingTime % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func processPlayerMove(for position: Int) {
        guard !isSquareOccupied(in: moves, forIndex: position) else { return } // Use guard to prevent further execution if occupied
        // Proceed with the move
        if isPlayerOneTurn {
            moves[position] = TwoPlayersModel.Move(player: .playerOne, boardIndex: position)
            if checkWinCondition(for: .playerOne, in: moves) {
                gameResultText = "Player One wins!"
                resultIcon = "Win-Icon"
                isGameOver = true
                stopTimer()
                return
            }
        } else {
            moves[position] = TwoPlayersModel.Move(player: .playerTwo, boardIndex: position)
            if checkWinCondition(for: .playerTwo, in: moves) {
                gameResultText = "Player Two wins!"
                resultIcon = "Win-Icon"
                isGameOver = true
                stopTimer()
                return
            }
        }
        
        // Check for a draw
        if checkForDraw(in: moves) {
            gameResultText = "Draw!"
            resultIcon = "Draw-Icon"
            isGameOver = true
            stopTimer()
            return
        }
        
        // Toggle the turn
        isPlayerOneTurn.toggle()
        currentTurn = isPlayerOneTurn ? .playerOne : .playerTwo
    }
    
    func isSquareOccupied(in moves: [TwoPlayersModel.Move?], forIndex index: Int) -> Bool {
        return moves.contains(where: { $0?.boardIndex == index })
    }
    
    func checkWinCondition(for player: TwoPlayersModel.Player, in moves: [TwoPlayersModel.Move?]) -> Bool {
        // Setting Win conditions
        let winPatterns: Set<Set<Int>> = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        
        let playerMoves = moves.compactMap { $0 }.filter { $0.player == player }
        let playerPositions = Set(playerMoves.map { $0.boardIndex })
        
        // If player move == a win condition, then win
        for pattern in winPatterns where pattern.isSubset(of: playerPositions) { return true }
        
        return false
    }
    
    func checkForDraw(in moves: [TwoPlayersModel.Move?]) -> Bool {
        // If all squares occupied, then draw
        return moves.compactMap { $0 }.count == 9
    }
    
    func resetGame() {
        moves = Array(repeating: nil, count: 9)
        currentTurn = .playerOne
        isGameOver = false
        gameResultText = ""
        resultIcon = ""
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
