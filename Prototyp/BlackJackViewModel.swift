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
    
    var bet: Int {
        return model.bet
    }
    
    var gameState: GameState {
        return model.gameState
    }
    
    var message: String {
        return model.message
    }
    
    func restartGame() {
        model = BlackJackViewModel.createBlackJackModel();
    }
    
    func hit() {
        model.hit()
    }
    
    func stand() {
        model.stand()
    }
    

    func incrementBet(value:Int) {
        if playerBalance >= value {
            model.incrementBet(value: value)
            changePlayerBalance(amount: value, type: "bet")
        }
    }
   
    func resetBet() {
        model.resetBet()
    }
    
    func changePlayerBalance(amount: Int, type: String) {
        model.changePlayerBalance(amount: amount, type: type)
    }
    
    func setGameState(state: GameState) {
        model.setGameState(state: state)
    }
    
    func changeBet() {
        model.changeBet()
    }
    
    func startWithSameBet() {
        model.startWithSameBet()
    }
    
    func shiftCards(numbCards: Int, index: Int) -> CGFloat {
        var offsetX: CGFloat
        
        if numbCards == 2 {
            offsetX = -30.0 + (CGFloat(index) * 50.0)
        } else if numbCards == 3 {
            offsetX = -50.0 + (CGFloat(index) * 50.0)
        } else if numbCards == 4 {
            offsetX = -70.0 + (CGFloat(index) * 50.0)
        } else if numbCards == 5 {
            offsetX = -80.0 + (CGFloat(index) * 40.0)
        } else if numbCards == 6 {
            offsetX = -80.0 + (CGFloat(index) * 30.0)
        } else {
            offsetX = -120.0 + (CGFloat(index) * 30.0)
        }
        return offsetX
    }
    
 }
    
