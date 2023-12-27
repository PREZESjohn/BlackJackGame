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
        bet = 100
        playerBalance = 1000
    }
    
    mutating func hit(){
        var score=playerCardsScore()
        print("wynik przed hit: "+String(score))
        
        playerHand.append(deck[0])
        deck.removeFirst(1)
        
         score=playerCardsScore()
        print("wynik po hit: "+String(score))
        if(score>21){
            print("gracz spalil karty")
        }
        
    }
    
    mutating func stay(){
        
    }
    
    mutating func bet(value: Int){
        
    }
    func playerCardsScore()->Int{
        var score: Int=0
        var aceCount=0
        
        for card in playerHand{
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

