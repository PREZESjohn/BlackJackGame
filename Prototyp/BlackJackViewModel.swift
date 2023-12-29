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
        model.hit()
    }
    
    func stand() {
        print("wejscie do viewmodel.stand")
        model.stand()
    }
    
    func incrementBet(value:Int) {
        let currentPlayerBalance=getPlayerBalance()
        if currentPlayerBalance>=value{
            model.incrementBet(value: value)
            changePlayerBalance(amount: value, type: "bet")
        }else{
            print("niewystarczajace srodki do zwiekszenia betu na koncie uzytkownika")
            //TODO: dodac wyswietlenie komunikatow (ogolnie trzeba dolozyc feedback systemu)
        }
        
    }
    func getBet()->Int{
        return model.bet
    }
    func resetBet(){
        model.resetBet()
    }
    func getPlayerBalance()->Int{
        return model.playerBalance
    }
    func changePlayerBalance(amount: Int, type: String){
        model.changePlayerBalance(amount: amount, type: type)
    }
    func getGameState()->GameState{
        return model.gameState
    }
    func setGameState(state: GameState){
        model.setGameState(state: state)
    }
    func getMessage()->String{
        return model.message
    }
    
    func startOver(){
        model.startOver()
    }
    func shiftCards(numbCards: Int, index: Int)->CGFloat{
        var offsetX: CGFloat
        
        if(numbCards==2){
            offsetX = -30.0+(CGFloat(index)*50.0)
        }else if(numbCards==3){
            offsetX = -50.0+(CGFloat(index)*50.0)
        }else if(numbCards==4){
            offsetX = -70.0+(CGFloat(index)*50.0)
        }else if(numbCards==5){
            offsetX = -80.0+(CGFloat(index)*40.0)
        }else if(numbCards==6){
            offsetX = -80.0+(CGFloat(index)*30.0)
        }else{
            offsetX = -80.0+(CGFloat(index)*20.0)
        }
        return offsetX
    }
    
 }
    
