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
        otherHand.append(deck[1])
        bet = 100
        playerBalance = 1000
    }
    
    mutating func hit(){
        
    }
    
    mutating func stay(){
        
    }
    
    mutating func bet(value: Int){
        
    }
    
    
    
    struct Card : Equatable, Identifiable {
            var id: String
            var value:String  = "2"
            var isFaceUp:Bool = false
            var suit: String = "♣︎"
    }
    
}

