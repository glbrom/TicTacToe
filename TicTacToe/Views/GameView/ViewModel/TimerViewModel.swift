//
//  TimerViewModel.swift
//  TicTacToe
//
//  Created by Roman Golub on 05.10.2024.
//

import SwiftUI

final class TimerViewModel: ObservableObject {
    @Published var remainingTime: Int = 0
    @Published var isTimerVisible: Bool = SettingGameViewModel().gameToggle
    private var timer: Timer?
    
    var totalTimeInSeconds: Int {
        return 60 
    }
    
    init() {
        resetTimer()
    }
    
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
        isTimerVisible = true
    }
    
    func resetTimer() {
        remainingTime = totalTimeInSeconds
        stopTimer()
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        isTimerVisible = false
    }
    
    func endGame() {
        print("Game Over. Remaining time: \(remainingTime) seconds")
        stopTimer()
    }
    
    var formattedTime: String {
        let minutes = remainingTime / 60
        let seconds = remainingTime % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    deinit {
        stopTimer()
    }
}

