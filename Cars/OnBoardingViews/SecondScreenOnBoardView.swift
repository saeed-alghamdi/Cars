//
//  SecondScreenOnBoardView.swift
//  Cars
//
//  Created by RMP on 26/07/1445 AH.
//

import SwiftUI

struct SecondScreenOnBoardView: View {
    
    @AppStorage("showingOnBoarding") var showingOnBoarding: Bool?
    
    @Binding var selection: Int
    
    var body: some View {
        
        ZStack {
            
            Color.black.ignoresSafeArea()
            
            Image("chevrolet").resizable().aspectRatio(contentMode: .fit).ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Image(systemName: "engine.combustion").font(.title).foregroundColor(.orange).shadow(color: .orange, radius: 10).shadow(color: .orange, radius: 1)
                    
                    Spacer()
                    
                    Image(systemName: "abs.brakesignal").font(.title).foregroundColor(.orange).shadow(color: .orange, radius: 10).shadow(color: .orange, radius: 1)
                    
                    Spacer()
                    
                    Image(systemName: "figure.seated.side.airbag.on").font(.title).foregroundColor(.orange).shadow(color: .orange, radius: 10).shadow(color: .orange, radius: 1)
                    
                    
                }.padding([.leading, .trailing], 60).offset(y: -UIScreen.main.bounds.height / 2.5)
                
                HStack {
                    
                    Image(systemName: "bolt.fill.batteryblock").font(.title).foregroundColor(.orange).shadow(color: .orange, radius: 10).shadow(color: .orange, radius: 1)
                    
                    Spacer()
                    
                    Image(systemName: "car.rear.and.tire.marks").font(.title).foregroundColor(.orange).shadow(color: .orange, radius: 10).shadow(color: .orange, radius: 1)
                    
                    Spacer()
                    
                    Image(systemName: "figure.seated.seatbelt").font(.title).foregroundColor(.orange).shadow(color: .orange, radius: 10).shadow(color: .orange, radius: 1)
                    
                    
                }.padding([.leading, .trailing], 40).offset(y: -UIScreen.main.bounds.height / 3)
                
                
            }
            
            
            VStack {
                
                Button() {
                    
                    showingOnBoarding = false
                    CarSoundHandler.stopCarSound()
                    
                    
                } label: {
                    Text("Skip").font(.headline).fontWeight(.semibold).foregroundColor(.primary).padding().padding(.horizontal, 20).frame(width: UIScreen.main.bounds.width - 20).background(Color.orange).cornerRadius(10).shadow(color: Color.orange, radius: 10)
                }
                
            }.offset(y: UIScreen.main.bounds.height / 3)
            
        }
        
        
    }
    
}

struct SecondScreenOnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreenOnBoardView(selection: .constant(1))
    }
}
