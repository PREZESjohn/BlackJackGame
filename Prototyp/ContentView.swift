//
//  ContentView.swift
//  Prototyp
//
//  Created by student on 17/12/2023.
//

import SwiftUI
import Foundation

struct ContentView: View {
    var cards:[(String,String)]=[("6","♥︎"),("9","♣︎"),("Q","♥︎")]
    @ObservedObject var viewModel: BlackJackViewModel
    var body: some View {
        VStack{
            Spacer()
            playerCards
        }.padding()
        
    }
    var playerCards: some View{
        HStack{
            HStack{
                ForEach(viewModel.playerHand){i in
                    CardView(rank: i.value, color:i.suit)
                }
            }
            HStack{
                ForEach(viewModel.otherHand){i in
                    CardView(rank: i.value, color:i.suit)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: BlackJackViewModel())
    }
}
