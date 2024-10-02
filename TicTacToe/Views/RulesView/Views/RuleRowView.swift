//
//  RuleRowView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

struct RuleRowView: View {
    var number: Int
    var text: String
    
    var body: some View {
        
        HStack(alignment: .top) {
            Image(systemName: "\(number).circle.fill")
                .font(.system(size: 45, weight: .thin))
                .foregroundStyle(.appBlack, .appPurple)

            Text(text)
                .padding(15)
                .font(.body)
                .frame(maxWidth: .infinity)
                .background(.appLightBlue)
                .clipShape(.rect(cornerRadius: 35))
                .padding(.horizontal)
                .foregroundColor(.black.opacity(0.9))
        }
    }
}

#Preview {
    RuleRowView(number: 1, text: "Draw a grid with three rows and three columns, creating nine squares in total.")
}
