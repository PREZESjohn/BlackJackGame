//
//  BlackJackViewModel.swift
//  Prototyp
//
//  Created by student on 17/12/2023.
//

import SwiftUI
import Foundation

class BlackJackViewModel: ObservableObject {
    
    
    private static func createBlackJackModel() -> BlackJackModel<String> {
        return BlackJackModel<String>()
    }
    
    @Published private var model = createBlackJackModel()
    
    var deck: Array<BlackJackModel<String>.Card> {
        return model.deck
    }
    
    var playerHand: Array<BlackJackModel<String>.Card> {
        return model.playerHand
    }
    
    var otherHand: Array<BlackJackModel<String>.Card> {
        return model.otherHand
    }
    
    var playerBalance: Int {
        return model.playerBalance
    }
    
    func hit() {
        
    }
    
    func stay() {
        
    }
    
    func bet(value:Int) {
        
    }
    
    func startOver(){
        model = BlackJackViewModel.createBlackJackModel()
    }
    
 }
    
