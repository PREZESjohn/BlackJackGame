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
            if viewModel.getGameState()==GameState.bet{
                if viewModel.getBet() != 0 {
                    Button(action: {viewModel.setGameState(state: GameState.start)}){
                        Text("Save bet and start game")
                            .font(.largeTitle)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(50)
                    }
                }else{
                    Text("Set bet")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.blue)
                        .background(Color.yellow)
                        .cornerRadius(50)
                }
            }else{
                VStack{
                    otherCards
                    Spacer()
                    Text(viewModel.getMessage())
                        .font(.largeTitle)
                        .padding()
                    Spacer()
                    playerCards
                    OptionButtons(viewModel: viewModel)
                }
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
