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
            if viewModel.getGameState()==GameState.bet{
                BetView(viewModel: viewModel)
            }else{
                VStack{
                    otherCards
                    Spacer()
                    Text(viewModel.getMessage())
                        .font(.largeTitle)
                        .padding()
                    Spacer()
                    playerCards
                        .frame(minWidth: 350)
                        .contentShape(Rectangle())
                        .gesture(DragGesture(minimumDistance: 10, coordinateSpace: .local)
                                    .onEnded({value in
                                        let horAmount=value.translation.width
                                        let verAmount=value.translation.height
                                        if (abs(horAmount)>abs(verAmount)){
                                            if horAmount < 0 && viewModel.getGameState()==GameState.start{
                                                viewModel.hit()
                                            }
                                        }else{
                                            if value.translation.height<0 && viewModel.getGameState()==GameState.start{
                                                viewModel.stand()
                                            }
                                        }
                                    })
                        )
                    OptionButtons(viewModel: viewModel)
                }
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        //.background(Color.blue.ignoresSafeArea())
        .background(
            LinearGradient(gradient:Gradient(colors: [.green,.yellow,.orange]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            .ignoresSafeArea()
        )
    }
    var playerCards: some View{
        ZStack{
            ForEach(viewModel.playerHand){i in
                CardView(rank: i.value, color:i.suit,isFaceUp: i.isFaceUp)
                    .offset(x: viewModel.shiftCards(numbCards: viewModel.playerHand.count, index: viewModel.playerHand.firstIndex(of: i) ?? 0))
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                    .animation(.easeInOut(duration: 0.5))
            }
        }
    }
    var otherCards: some View{
        ZStack{
            ForEach(viewModel.otherHand){i in
                CardView(rank: i.value, color:i.suit,isFaceUp: i.isFaceUp)
                    .offset(x: viewModel.shiftCards(numbCards: viewModel.otherHand.count, index: viewModel.otherHand.firstIndex(of: i) ?? 0))
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                    .animation(.easeInOut(duration: 0.5))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: BlackJackViewModel())
    }
}
