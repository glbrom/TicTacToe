//
//  TimerViewModel.swift
//  TicTacToe
//
//  Created by Roman Golub on 05.10.2024.
//

import SwiftUI

final class TimerViewModel: ObservableObject {
    @Published var remainingTime: Int = 0
    @Published var elapsedTime: Int = 0
    @Published var isTimerVisible: Bool = SettingGameViewModel().gameToggle
    
    private var timer: Timer?
    
    var totalTimeInSeconds: Int {
        switch SettingGameViewModel().choosedTime {
        case "30 sec":
            return 30
        case "60 sec":
            return 60
        case "120 sec":
            return 120
        default:
            return 60
        }
    }
    
    init() {
        resetTimer()
    }
    
    func startTimer() {
        remainingTime = totalTimeInSeconds
        elapsedTime = 0
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.remainingTime > 0 {
                self.remainingTime -= 1
                self.elapsedTime += 1
            } else {
                self.timer?.invalidate()
                self.endGame()
            }
        }
    }
    
    func resetTimer() {
        remainingTime = totalTimeInSeconds
        elapsedTime = 0
        stopTimer()
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func endGame() {
        print("Game Over. Remaining time: \(remainingTime) seconds")
        stopTimer()
    }
    
    func saveGameTime() {
        let gameTime = elapsedTimeTime
        DataManager.shared.saveTime(gameTime)
    }
    
    var elapsedTimeTime: String {
        let minutes = elapsedTime / 60
        let seconds = elapsedTime % 60
        return String(format: "%02d:%02d", minutes, seconds)
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
