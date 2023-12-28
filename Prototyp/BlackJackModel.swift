//
//  BlackJackModel.swift
//  Prototyp
//
//  Created by student on 17/12/2023.
//

import Foundation
import SwiftUI

// zawiera talie 52 kart,
// aktualny status konta gracza,
// mozliwe stawki do obstawienia
// reka gracza
// reka krupiera

struct BlackJackModel<CardContent> where CardContent : Equatable {
    private(set) var deck: Array<Card>
    private(set) var playerHand: Array<Card>
    private(set) var otherHand: Array<Card>
    private(set) var playerBalance: Int
    private(set) var bet:Int
    private(set) var gameState: GameState

    init(){
        deck = []
        playerHand = []
        otherHand = []
        let values: Array<String> = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
        let suits = ["♣︎","♥︎","♦︎","♠︎"]
        for s in suits {
            for v in values {
                deck.append(Card(id:UUID().uuidString, value: v, suit: s))
            }
        }
        deck.shuffle()
        playerHand.append(deck[0])
        playerHand.append(deck[1])
        otherHand.append(deck[2])
        otherHand.append(deck[3])
        deck.removeFirst(4)
        otherHand[0].isFaceUp=false
        bet = 0
        playerBalance = 1000
        gameState = .bet
    }
    
    mutating func hit(){
        var score=handCardsScore(hand: playerHand)
        print("wynik przed hit: "+String(score))
        
        playerHand.append(deck[0])
        deck.removeFirst(1)
        
         score=handCardsScore(hand: playerHand)
        print("wynik po hit: "+String(score))
        if(score>21){
            print("gracz spalil karty")
        }
        
    }
    mutating func otherHandHit(){
        print("wejscie do model.otherhandhit")

        var score=handCardsScore(hand: otherHand)
        print("wynik przed hit: "+String(score))
        
        otherHand.append(deck[0])
        deck.removeFirst(1)
        
        score=handCardsScore(hand: otherHand)
        print("wynik po hit: "+String(score))
        if(score>21){
            print("krupier spalil karty")
        }
        
    }
    
    
    mutating func stand(){
        print("wejscie do model.stand")
        otherHand[0].isFaceUp=true
        let score=handCardsScore(hand: otherHand)
        print("wynik przed hit: "+String(score))
        while handCardsScore(hand: otherHand)<17{
            otherHandHit()
        }
    }
    
    mutating func incrementBet(value: Int){
        bet+=value
    }
    mutating func resetBet(){
        bet=0
    }
    mutating func setPlayerBalance(amount: Int){
        playerBalance=amount
    }
    mutating func setGameState(state: GameState){
        gameState=state
    }
    
    func handCardsScore(hand: Array<Card>)->Int{
        var score: Int=0
        var aceCount=0
        
        for card in hand{
            switch card.value {
                case "J","Q","K":
                    score+=10
                case "A":
                    score+=11
                    aceCount+=1
                default:
                    score+=Int(card.value) ?? 0
            }
            while(score>21 && aceCount>0){
                score-=10
                aceCount-=1
            }
        }
        return score
    }
    
    
    struct Card : Equatable, Identifiable {
            var id: String
            var value:String  = "2"
            var isFaceUp:Bool = true
            var suit: String = "♣︎"
    }
    
}

