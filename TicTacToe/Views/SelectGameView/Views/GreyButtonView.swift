//
//  GreyButtonView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//


import SwiftUI

struct GreyButtonView: View {
    
    var buttonTitle: String
    var icon: String
    
    var body: some View {
         
        ZStack{
            HStack(alignment: .center) {
                Image(icon)
                Text(buttonTitle)
            }
            .font(.system(size: 20, weight: .medium))
            .padding(.horizontal, 42)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(.appGrey)
            .cornerRadius(30)
        }
    }
}

#Preview {
    GreyButtonView(buttonTitle: "Single Player", icon: "Single-Player-Icon")
        
    
}

