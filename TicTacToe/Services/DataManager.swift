//
//  DataManager.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import Foundation

final class DataManager {
    
    static let shared = DataManager()
    
    private init() {}
    
    
    func saveUserResult(_ result: Int) {
            UserDefaults.standard.set(result, forKey: "userName")
        }
    
    func getUserResult(_ result: Int) {
        UserDefaults.standard.integer(forKey: "userName")
        }
    
}
