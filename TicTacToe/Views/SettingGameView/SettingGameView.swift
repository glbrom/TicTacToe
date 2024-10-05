//
//  SettingGameView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

struct SettingGameView: View {
    
    @ObservedObject var model = SettingGameViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    init(model: SettingGameViewModel) {
        self.model = model
    }
    
    @State var isPickerDuration: Bool = false
    @State var isPickerMusic: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .ignoresSafeArea(.all)
                    .foregroundColor(.appBackground)
                
                VStack {
                    HStack(alignment: .center) {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.black)
                                .frame(width: 30, height: 20)
                            
                        }
                        
                        Spacer()
                        
                        Text(GameConfig.settings)
                            .font(
                                Font.custom("SF Pro Display", size: 24)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                            .frame(width: geo.size.width / 3)
                    }
                    
                    ScrollView(showsIndicators: false) {
                        
                        VStack {
                            SettingLabelView(title: model.gameTitle,
                                             toggle: $model.gameToggle)
                            .padding(.bottom, 10)
                            
                            selectItem(model.durationTitle, model.choosedTime)
                                .padding(.bottom, 10)
                                .isHidden(model.gameToggle == false)
                                .onTapGesture {
                                    isPickerDuration.toggle()
                                }
                                .sheet(isPresented: $isPickerDuration) {
                                    PickerView(selectedItem: $model.choosedTime,
                                               items: model.duration)
                                }
                            
                            SettingLabelView(title: model.musicTitle,
                                             toggle: $model.musicToggle)
                            .onChange(of: model.musicToggle, perform: { toggle in
                                if toggle {
                                    AudioManager.shared.playSound(named: model.choosedMusic)
                                } else {
                                    AudioManager.shared.stopSound()
                                }
                            })
                            .padding(.bottom, 10)
                            
                            selectItem(model.selectMusicTitle, model.choosedMusic)
                                .padding(.bottom, 10)
                                .isHidden(model.musicToggle == false)
                                .onTapGesture {
                                    isPickerMusic.toggle()
                                }
                                .onChange(of: model.choosedMusic, perform: { value in
                                    AudioManager.shared.stopSound()
                                    AudioManager.shared.playSound(named: value)
                                })
                                .sheet(isPresented: $isPickerMusic) {
                                    PickerView(selectedItem: $model.choosedMusic,
                                               items: model.music)
                                }
                        }
                        .padding(.all, 20)
                        .background(Color.white)
                        .cornerRadius(30)
                        .shadow(color: Color(red: 0.6, green: 0.62, blue: 0.76).opacity(0.3), radius: 5, x: 0, y: 8)
                        
                        Spacer()
                        
                        VStack {
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                                ForEach(model.items) { item in
                                    SelectableView(item: item, action: {
                                        model.pickItem(item)
                                    })
                                }
                            }
                            .padding()
                        }
                    }
                    
                }
                .padding(.horizontal, 21)
            }
            
            .navigationBarBackButtonHidden(true)
        }
    }
}

extension SettingGameView {
    
    func selectItem(_ text: String, _ item: String) -> some View {
        HStack {
            Text(text)
                .multilineTextAlignment(.center)
                .font(Font.custom("SF Pro Display", size: 20))
                .foregroundColor(.appBlack)
            
            Spacer()
            
            Text(item)
            
        }
        .padding(.all, 20)
        .background(Color.appLightBlue)
        .cornerRadius(30)
    }
}


#Preview {
    SettingGameView(model: SettingGameViewModel())
}


