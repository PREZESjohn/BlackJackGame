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
    private(set) var message: String

    init(){
        deck=[]
        playerHand = []
        otherHand = []
        bet = 0
        playerBalance = 1000
        gameState = .bet
        message="Hit or stand"

        createDeck()
        
        playerHand.append(deck[0])
        playerHand.append(deck[1])
        otherHand.append(deck[2])
        otherHand.append(deck[3])
        deck.removeFirst(4)
        otherHand[0].isFaceUp=false
        
    }
    // tworzy talie kart i randomizuje
    mutating func createDeck(){
        deck = []
        let values: Array<String> = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
        let suits = ["♣︎","♥︎","♦︎","♠︎"]
        for s in suits {
            for v in values {
                deck.append(Card(id:UUID().uuidString, value: v, suit: s))
            }
        }
        deck.shuffle()
    }
    // funckja do ponownej rozgrywki (mozliwe przerobienie konstruktora aby to nie bylo potrzebne ale to trzeba pomyslec)
    mutating func startOver(){
        createDeck()
        playerHand=[]
        otherHand=[]
        bet=0
        message="Hit or stand"
        setGameState(state: .bet)
        
        playerHand.append(deck[0])
        playerHand.append(deck[1])
        otherHand.append(deck[2])
        otherHand.append(deck[3])
        deck.removeFirst(4)
        otherHand[0].isFaceUp=false
        
    }
    //funkcja do ponownej rozgrywki, z tym samym zakladem. Mozliwosc ciaglego grania, bez przechodzienia do okna zakladu
    mutating func startWithSameBet(){
        if(playerBalance>=bet){
            createDeck()
            playerHand=[]
            otherHand=[]
            
            changePlayerBalance(amount: bet, type: "bet")
            message="Hit or stand"
            setGameState(state: .start)
            
            playerHand.append(deck[0])
            playerHand.append(deck[1])
            otherHand.append(deck[2])
            otherHand.append(deck[3])
            deck.removeFirst(4)
            otherHand[0].isFaceUp=false
        }
    }
    // dodanie karty do tali gracza. Jesli wynik kart gracza wynosi powyzej 20 to gra przechodzi do wykonywania dzialan przez krupiera
    mutating func hit(){
        playerHand.append(deck[0])
        deck.removeFirst(1)
        let score=handCardsScore(hand: playerHand)
        if score > 21 {
            checkGame()
        }else if score == 21{
            stand()
        }
    }
    //dodanie karty do tali krupiera
    mutating func otherHandHit(){
        otherHand.append(deck[0])
        deck.removeFirst(1)
    }
    
    // pokazywanie ukrytej karty w tali krupiera oraz wykonywanie dodawania karty dla tali krupiera, do momentu az ich wartosc nie przekroczy 17, pozniej sprawdza stan kart gracza oraz krupiera
    mutating func stand(){
        otherHand[0].isFaceUp=true
        while handCardsScore(hand: otherHand)<17{
            otherHandHit()
            
            //TODO: dodanie rodziaju opozniejia kodu
        }
        checkGame()
    }
    // dodaje wartosc do zakladu
    mutating func incrementBet(value: Int){
        bet+=value
    }
    // zeruje zaklad oraz zwraca wartosc zakladu do konta gracza
    mutating func resetBet(){
        playerBalance+=bet
        bet=0
    }
    //zmienia stan konta gracza zaleznie od dzialania. Dla ukladania zakladu - zabiera kwote z konta gracza, dla wyniku gry - dodaje kwote z zakladu do konta gracza
    mutating func changePlayerBalance(amount: Int, type: String){
        if type=="bet"{
            playerBalance =  playerBalance-amount
        }else if type=="result"{
            playerBalance = playerBalance+2*amount
        }
    }
    // ustawia stan gry
    mutating func setGameState(state: GameState){
        gameState=state
    }
    // zlicza wartosc kart w rece
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
    //sprawdza stan rozgrywki i zaleznie od stanu, zmienia wyswietlana wiadomosc, dodaje nagrode jesli sie nalezy
    mutating func checkGame(){
        otherHand[0].isFaceUp=true
        let playerScore=handCardsScore(hand: playerHand)
        let otherScore=handCardsScore(hand: otherHand)
        
        //TODO: dodac ekstremalne sytuacje brzegowe np. jesli gracz ma blackjack przy 3 kartach, a krupier ma blackjack przy 2 to krupier wygrywa
        //TODO: uzycie tej funckji w miejscach gdzie na konsoli byly printowane wyniki (trzeba przeniesc funcje do modelu)
        setGameState(state: .result)
        
        if playerScore==21{
            message="Player Blackjack! You win"
            changePlayerBalance(amount: bet, type: "result")
        }else if otherScore==21{
            message="Dealer Blackjack! You lose"
        }else if playerScore > 21{
            message="Player busted. You lose"
        }else if otherScore > 21{
            message="Dealer busted. You win"
            changePlayerBalance(amount: bet, type: "result")
        }else if playerScore < otherScore{
            message="You lose"
        }else if playerScore > otherScore{
            message="You win"
            changePlayerBalance(amount: bet, type: "result")
        }else{
            message="Tie"
        }
        
        
    }

    struct Card : Equatable, Identifiable {
            var id: String
            var value:String  = "2"
            var isFaceUp:Bool = true
            var suit: String = "♣︎"
    }
    
}

