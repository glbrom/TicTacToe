//
//  SrttingGameViewModel.swift
//  TicTacToe
//
//  Created by Руслан on 2.10.2024.
//

import Foundation
import SwiftUI

enum GameConfig {
    static let durationOptions = ["30 sec", "60 sec", "120 sec"]
    static let musicOptions = ["Classical", "Instrumentals", "Nature"]
    
    static let gameTitle = "Game Time"
    static let musicTitle = "Music"
    static let durationTitle = "Duration"
    static let selectMusicTitle = "Select Music"
    
    static let picked = "Picked"
    static let choose = "Choose"
    
    static let settings = "Settings"
}

struct SelectableItem: Identifiable, Codable {
    let id: UUID
    let imageNames: [String]
    var isPicked: Bool = false
    
    init(id: UUID = UUID(), imageNames: [String], isPicked: Bool = false) {
        self.id = id
        self.imageNames = imageNames
        self.isPicked = isPicked
    }
}

class SettingGameViewModel: ObservableObject {
    
    @AppStorage("choosedMusic") var choosedMusic: String = GameConfig.musicOptions[0]
    @AppStorage("choosedTime") var choosedTime: String = GameConfig.durationOptions[0]
    @AppStorage("gameToggle") var gameToggle: Bool = false
    @AppStorage("musicToggle") var musicToggle: Bool = true
    @AppStorage("selectedItem") var selectedItemData: String = ""
    
    let duration = GameConfig.durationOptions
    let music = GameConfig.musicOptions
    let gameTitle = GameConfig.gameTitle
    let musicTitle = GameConfig.musicTitle
    let durationTitle = GameConfig.durationTitle
    let selectMusicTitle = GameConfig.selectMusicTitle
    
    @Published var items: [SelectableItem] =  [
        SelectableItem(imageNames: ["Xskin1", "Oskin1"]),
        SelectableItem(imageNames: ["Xskin3", "Oskin3"]),
        SelectableItem(imageNames: ["Xskin4", "Oskin4"]),
        SelectableItem(imageNames: ["Xskin5", "Oskin5"]),
        SelectableItem(imageNames: ["Xskin6", "Oskin6"]),
        SelectableItem(imageNames: ["Xskin6-2", "Oskin6-2"])
    ]
    
    init() {
        setupIsPicked()
        if musicToggle {
            AudioManager.shared.playSound(named: choosedMusic)
        }
    }
    
    func setupIsPicked() {
        if selectedItemData == "" {
            items[0].isPicked = true
        } else {
            for item in items.indices {
                if items[item].imageNames[0] == selectedItemData {
                    items.indices.forEach { items[$0].isPicked = false }
                    items[item].isPicked = true
                }
            }
        }
    }
    
    func pickItem(_ item: SelectableItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items.indices.forEach { items[$0].isPicked = false }
            items[index].isPicked = true
            selectedItemData = items[index].imageNames[0]
        }
    }
}
