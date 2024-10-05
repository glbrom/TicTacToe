//
//  PickerView.swift
//  TicTacToe
//
//  Created by Руслан on 2.10.2024.
//

import SwiftUI

struct PickerView: View {
    @Binding var selectedItem: String
    
    let items: [String]
    
    var body: some View {
        VStack {
            Text("")
                .font(.headline)
            Picker("", selection: $selectedItem) {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
            }
            .pickerStyle(WheelPickerStyle())
        }
        .padding()
    }
}
