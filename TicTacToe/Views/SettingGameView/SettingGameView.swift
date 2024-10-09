//
//  SettingGameView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

struct SettingGameView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var model = SettingGameViewModel()
    @ObservedObject var audioManager = AudioManager.shared
    
    @State private var gameTimeDisclosure = true
    @State private var musicDisclosure: Bool = false
    
    @State var isPickerDuration: Bool = false
    @State var isPickerMusic: Bool = false
    
    init(model: SettingGameViewModel) {
        self.model = model
    }
    
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
                            audioManager.stopSound()
                        } label: {
                            Image("Back-Icon")
                        }
                        
                        Spacer()
                        
                        Text(GameConfig.settings)
                            .font(.system(size: 20, weight: .bold))
                        
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                            .frame(width: geo.size.width / 3)
                    }
                    
                    ScrollView(showsIndicators: false) {
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundStyle(.white)
                                VStack {
                                    DisclosureGroupDuration
                                        .padding(.bottom, -20)
                                    DisclosureGroupMusic
                                        .padding(.bottom, model.musicToggle ? 0 : -25)
                                }
                            }
                            .padding(.top, 40)
                            .frame(width:348)
                        }
                        
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
                .padding(.horizontal, 20)
            }
            .shadow(color: Color(red: 0.6, green: 0.62, blue: 0.76).opacity(0.3), radius: 15, x: 4, y: 4)
            .onDisappear {
                audioManager.stopSound()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    var DisclosureGroupDuration: some View {
        VStack {
            ZStack { RoundedRectangle(cornerRadius: 30)
                    .foregroundStyle(Color.appLightBlue)
                Toggle(isOn: $model.gameToggle.animation(.bouncy)) {
                    Text(model.gameTitle)
                        .font(.system(size: 20).bold())
                }.onChange(of: model.gameToggle, perform: { value in
                    model.gameToggle = value
                })
                .tint(Color.appBlue)
                .padding(20)
            }.frame(width:308, height: 69)
                .padding(.top,20)
                .padding(.bottom,20)
            
            if model.gameToggle {
                ZStack() {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(Color.appLightBlue)
                        .frame(width: 308)
                    VStack() {
                        
                        DisclosureGroup( isExpanded: $gameTimeDisclosure) {
                            VStack(spacing: 0) {
                                
                                Divider()
                                    .background(Color.appBlue)
                                
                                Toggle(isOn: Binding(
                                    get: { model.choosedTime == "30 sec" },
                                    set: { isOn in
                                        if isOn {
                                            model.choosedTime = "30 sec"
                                            model.gameToggle = true
                                        }
                                    })) {
                                        
                                        Text("30 sec")
                                            .setToogleText()
                                    }
                                    .background(model.choosedTime == "30 sec" ? Color.appPurple : .clear)
                                    .toggleStyle(.button)
                                
                                Toggle(isOn: Binding(
                                    get: { model.choosedTime == "60 sec" },
                                    set: { isOn in
                                        if isOn {
                                            model.choosedTime = "60 sec"
                                            model.gameToggle = true
                                        }
                                    })) {
                                        
                                        Text("60 sec")
                                            .setToogleText()
                                    }
                                    .background(model.choosedTime == "60 sec" ? Color.appPurple : .clear)
                                    .toggleStyle(.button)
                                
                                Toggle(isOn: Binding(
                                    get: { model.choosedTime == "120 sec" },
                                    set: { isOn in
                                        if isOn {
                                            model.choosedTime = "120 sec"
                                            model.gameToggle = true
                                        }
                                    })) {
                                        
                                        Text("120 sec")
                                            .setToogleText()
                                    }
                                    .background(model.choosedTime == "120 sec" ? Color.appPurple : .clear)
                                    .toggleStyle(.button)
                                    .padding(.bottom, 25)
                            }
                        } label: {
                            HStack {
                                Text(model.durationTitle)
                                    .font(.system(size: 20).bold())
                                    .tint(Color.black)
                                    .padding(.leading,20)
                                    .frame(height: 61)
                                Spacer()
                                Text(model.choosedTime)
                                    .tint(Color.black)
                                    .font(.system(size: 20))
                            }
                            
                        }.accentColor(.clear)
                    }
                }
                .padding(.bottom, 20)
                .frame(width: 308)
            }
        }
    }
    
    var DisclosureGroupMusic: some View {
        VStack {
            ZStack { RoundedRectangle(cornerRadius: 30)
                    .foregroundStyle(Color.appLightBlue)
                
                Toggle(isOn: $model.musicToggle.animation(.bouncy)) {
                    Text(model.musicTitle)
                        .font(.system(size: 20).bold())
                }
                .onChange(of: model.musicToggle, perform: { value in
                    if value {
                        if !audioManager.isPlaying {
                            audioManager.playSound(named: model.choosedMusic)
                        }
                        musicDisclosure = true
                    } else {
                        audioManager.stopSound()
                    }
                })
                .tint(Color.appBlue)
                .padding(20)
                
            }.frame(width:308, height: 69)
                .padding(.top,20)
                .padding(.bottom,20)
            
            if model.musicToggle {
                ZStack() {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(Color.appLightBlue)
                        .frame(width: 308)
                    
                    DisclosureGroup(isExpanded: $musicDisclosure) {
                        VStack(spacing: 0) {
                            Divider()
                                .background(Color.appBlue)
                            
                            Toggle(isOn: Binding(
                                get: { model.choosedMusic == "Classical" },
                                set: { isOn in
                                    if isOn {
                                        model.selectMusic("Classical")
                                    }
                                })) {
                                    
                                    Text("Classical")
                                        .padding(.trailing, 190)
                                        .font(.system(size: 20))
                                        .frame(width: 282, height: 40)
                                        .tint(.black)
                                }
                                .background(model.choosedMusic == "Classical" ? Color.appPurple : .clear)
                                .toggleStyle(.button)
                            
                            Toggle(isOn: Binding(
                                get: { model.choosedMusic == "Instrumentals" },
                                set: { isOn in
                                    if isOn {
                                        model.selectMusic("Instrumentals")
                                    }
                                })) {
                                    
                                    Text("Instrumentals")
                                        .padding(.trailing, 150)
                                        .font(.system(size: 20))
                                        .frame(width: 282, height: 40)
                                        .tint(.black)
                                }
                                .background(model.choosedMusic == "Instrumentals" ? Color.appPurple : .clear)
                                .toggleStyle(.button)
                            
                            Toggle(isOn: Binding(
                                get: { model.choosedMusic == "Nature" },
                                set: { isOn in
                                    if isOn {
                                        model.selectMusic("Nature")
                                    }
                                })) {
                                    
                                    Text("Nature")
                                        .setToogleText()
                                }
                                .background(model.choosedMusic == "Nature" ? Color.appPurple : .clear)
                                .toggleStyle(.button)
                                .padding(.bottom, 25)
                        }
                    } label: {
                        HStack {
                            Text(model.selectMusicTitle)
                                .font(.system(size: 20).bold())
                                .tint(Color.black)
                                .padding()
                                .frame(height: 61)
                            
                            Spacer()
                            
                            Text(model.choosedMusic)
                                .tint(Color.black)
                                .font(.system(size: 20))
                        }
                    }
                }.accentColor(.clear)
            }
        }
        .padding(.bottom, 30)
        .frame(width: 308)
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

struct ToggleText: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(.trailing,210)
            .font(.system(size: 20))
            .frame(width:282, height: 40)
            .tint(.black)
    }
}
extension View {
    func setToogleText() -> some View {
        modifier(ToggleText())
    }
}

#Preview {
    SettingGameView(model: SettingGameViewModel())
}
