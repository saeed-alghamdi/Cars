//
//  soundHandler.swift
//  Cars
//
//  Created by RMP on 27/10/1447 AH.
//

import Foundation
import AudioToolbox



class CarSoundHandler {
    
    static var soundID: SystemSoundID = 0
    
    static func loadAndPlayCarSound() {
        
        if let soundUrl = Bundle.main.url(forResource: "blower_start", withExtension: "mp3") {
            
            let error = AudioServicesCreateSystemSoundID(soundUrl as CFURL, &soundID)
            
            if error != kAudioServicesNoError {
                fatalError("Something error: \(error.description)")
            }
            
        }
        
        AudioServicesPlayAlertSound(soundID)
        
        
    }


    static func stopCarSound() {
        
        AudioServicesDisposeSystemSoundID(soundID)
        
    }
    
}
