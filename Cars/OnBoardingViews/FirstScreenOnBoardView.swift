//
//  ScreenOne_Refactore.swift
//  Cars
//
//  Created by RMP on 17/07/1445 AH.
//

import SwiftUI

struct FirstScreenOnBoardView: View {
    
    @Binding var selection: Int
    
    @AppStorage("showingOnBoarding") var showingOnBoarding: Bool?
    
    @State var turnLightToOrange: Bool = false
    
    @State var counter: Int = 0
    
    
    var body: some View {
        
        ZStack {
            
            Color.black.ignoresSafeArea()
            
            Image("bmw").resizable().aspectRatio(contentMode: .fit).ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Image(systemName: "engine.combustion").font(.title).foregroundColor(turnLightToOrange ? .orange : Color(uiColor: UIColor.darkGray)).shadow(color: turnLightToOrange ? .orange : Color(uiColor: UIColor.darkGray), radius: 10).shadow(color: turnLightToOrange ? .orange : Color(uiColor: UIColor.darkGray), radius: 1)
                    
                    Spacer()
                    
                    Image(systemName: "abs.brakesignal").font(.title).foregroundColor(turnLightToOrange ? .orange : Color(uiColor: UIColor.darkGray)).shadow(color: turnLightToOrange ? .orange : Color(uiColor: UIColor.darkGray), radius: 10).shadow(color: turnLightToOrange ? .orange : Color(uiColor: UIColor.darkGray), radius: 1)
                    
                    Spacer()
                    
                    Image(systemName: "figure.seated.side.airbag.on").font(.title).foregroundColor(turnLightToOrange ? .orange : Color(uiColor: UIColor.darkGray)).shadow(color: turnLightToOrange ? .orange : Color(uiColor: UIColor.darkGray), radius: 10).shadow(color: turnLightToOrange ? .orange : Color(uiColor: UIColor.darkGray), radius: 1)
                    
                    
                }.padding([.leading, .trailing], 60).offset(y: -UIScreen.main.bounds.height / 2.5)
                
                HStack {
                    
                    Image(systemName: "bolt.fill.batteryblock").font(.title).foregroundColor(turnLightToOrange ? .orange : Color(uiColor: UIColor.darkGray)).shadow(color: turnLightToOrange ? .orange : Color(uiColor: UIColor.darkGray), radius: 10).shadow(color: turnLightToOrange ? .orange : Color(uiColor: UIColor.darkGray), radius: 1)
                    
                    Spacer()
                    
                    Image(systemName: "car.rear.and.tire.marks").font(.title).foregroundColor(turnLightToOrange ? .orange : Color(uiColor: UIColor.darkGray)).shadow(color: turnLightToOrange ? .orange : Color(uiColor: UIColor.darkGray), radius: 10).shadow(color: turnLightToOrange ? .orange : Color(uiColor: UIColor.darkGray), radius: 1)
                    
                    Spacer()
                    
                    Image(systemName: "figure.seated.seatbelt").font(.title).foregroundColor(turnLightToOrange ? .orange : Color(uiColor: UIColor.darkGray)).shadow(color: turnLightToOrange ? .orange : Color(uiColor: UIColor.darkGray), radius: 10).shadow(color: turnLightToOrange ? .orange : Color(uiColor: UIColor.darkGray), radius: 1)
                    
                    
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
            
        }.onAppear(perform: {
            
            Timer.scheduledTimer(withTimeInterval: 0.70, repeats: true) { insideTimer in
                
                counter += 1
                if counter == 3 {
                    
                    turnLightToOrange = true
                    
                }
                
                
            }
            
        })
        
    }
    
}

struct FirstScreenOnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreenOnBoardView(selection: .constant(0))
    }
}
