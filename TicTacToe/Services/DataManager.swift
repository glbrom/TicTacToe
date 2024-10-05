//
//  DataManager.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

final class DataManager {
    
    static let shared = DataManager()
    
    private let timeKey = "gameTimes"
    
    private init() {}
    
    func saveTime(_ time: String) {
        var gameTimes = getTimes()
        gameTimes.append(time)
        UserDefaults.standard.set(gameTimes, forKey: timeKey)
    }
    
    func getTimes() -> [String] {
        return UserDefaults.standard.stringArray(forKey: timeKey) ?? []
    }
}
