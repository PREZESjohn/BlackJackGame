//
//  ContentView.swift
//  Prototyp
//
//  Created by student on 17/12/2023.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @ObservedObject var viewModel: BlackJackViewModel
    var body: some View {
        HStack(){
            BetButtons(viewModel: viewModel)
                .padding(.trailing,35)
            VStack{
                otherCards
                Spacer()
                
                Spacer()
                playerCards
                OptionButtons(viewModel: viewModel)
            }
            Spacer()
        }
        
        
    }
    var playerCards: some View{
        ZStack{
            ForEach(viewModel.playerHand){i in
                CardView(rank: i.value, color:i.suit,isFaceUp: i.isFaceUp)
                    .offset(x: viewModel.shiftCards(numbCards: viewModel.playerHand.count, index: viewModel.playerHand.firstIndex(of: i) ?? 0))
            }
        }
    }
    var otherCards: some View{
        ZStack{
            ForEach(viewModel.otherHand){i in
                CardView(rank: i.value, color:i.suit,isFaceUp: i.isFaceUp)
                    .offset(x: viewModel.shiftCards(numbCards: viewModel.otherHand.count, index: viewModel.otherHand.firstIndex(of: i) ?? 0))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: BlackJackViewModel())
    }
}
