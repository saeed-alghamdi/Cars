//
//  OnBoardTabView.swift
//  Cars
//
//  Created by RMP on 29/07/1445 AH.
//

import SwiftUI



struct OnBoardTabView: View {
    
    init() {
        CarSoundHandler.loadAndPlayCarSound()
    }
    
    @State var selection = 0
    
    var body: some View {
        
        ZStack {
            
            Color.black.ignoresSafeArea()
            
            TabView(selection: $selection) {
                
                FirstScreenOnBoardView(selection: $selection).tag(0)
                SecondScreenOnBoardView(selection: $selection).tag(1)
                ThirdScreeonOnBoardView(selection: $selection).tag(2)
                FourthScreenOnBoardView(selection: $selection).tag(3)
                FifthScreenOnBoardView(selection: $selection).tag(4)
                SixthScreenOnBoardView(selection: $selection).tag(5)
                SeventhScreenOnBoardView(selection: $selection).tag(6)
                EighthScreenOnBoardView(selection: $selection).tag(7)
                NinthScreenOnBoardView(selection: $selection).tag(8)
                
                
                
            }.onAppear(perform: {
                
                Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { insideTimer in
                    
                    selection += 1
                    if selection == 9 {
                        
                        selection = 0
                        
                    }
                    
                    
                }
                
            }).tag(selection).animation(.default, value: 2).tabViewStyle(.page(indexDisplayMode: .never))
            
        }.onDisappear {
            
            CarSoundHandler.stopCarSound()
            
        }
        
    }
    
    
}

struct OnBoardTabView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardTabView()
    }
}
