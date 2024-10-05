//
//  SelectGame2View.swift
//  TicTacToe
//
//  Created by Sergey Zakurakin on 10/4/24.
//

import SwiftUI

//struct SelectGame2View: View {
//    var body: some View {
//        NavigationView {
//            VStack {
//                NavigationLink(destination: GameViewComputerTest(selectedDifficulty: .easy)) {
//                    Text("Go to Easy Game")
//                }
//            }
//        }
//    }
//}

struct SelectGame2View: View {
    var body: some View {
        NavigationView {
            ZStack {
                
                
                Color.appBackground
                    .ignoresSafeArea()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .shadow(color: .appLightBlue, radius: 15)
                    
                    VStack(spacing: 20) {
                        Text("Select Game")
                            .font(.system(size: 24, weight: .medium))
                        
                        NavigationLink(destination: GameViewComputerTest(selectedDifficulty: .easy)) {
                            HStack(alignment: .center) {
                                Image("Easy-Icon")
                                Text("Easy")
                            }
                            .customGrey()
                            .onAppear {
                                print("Easy button tapped")
                            }
                        }
                        
                        NavigationLink(destination: GameViewComputerTest(selectedDifficulty: .standard)) {
                            HStack(alignment: .center) {
                                Image("Medium-Icon")
                                Text("Medium")
                            }
                            .customGrey()
                        }
                        
                        NavigationLink(destination: GameViewComputerTest(selectedDifficulty: .hard)) {
                            HStack(alignment: .center) {
                                Image("Hard-Icon")
                                Text("Hard")
                            }
                            .customGrey()
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .frame(height: 336)
                .padding(.horizontal, 52)
            }
            .navigationBarBackButtonHidden(true)
        } 
    }
}

#Preview {
    SelectGame2View()
}
