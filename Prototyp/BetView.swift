//
//  ButtonView.swift
//  Prototyp
//
//  Created by student on 01/01/2024.
//

import SwiftUI

struct BetView: View {
    private let bets: [Bet]=[
        Bet(amount: 5, color: .red,id: "5"),
        Bet(amount: 20, color: .yellow,id: "20"),
        Bet(amount: 50, color: .blue,id: "50"),
        Bet(amount: 200, color: .orange,id: "200")
    ]
    @ObservedObject var viewModel: BlackJackViewModel
    
    var body: some View {
        VStack{
            Text("BlackJack")
                .font(.system(size: 80))
                .bold()
            Text("Card Game")
                .font(.largeTitle)
            Spacer()
            HStack{
                VStack{
                    HStack(){
                        Text("Player balance")
                            .font(.title)
                        Spacer()
                        Text(String(viewModel.getPlayerBalance()))
                            .font(.title)
                            .frame(width: 80, height: 40)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                            
                    }
                    HStack(){
                        Text("Bet")
                            .font(.title)
                        Spacer()
                        Text(String(viewModel.getBet()))
                            .font(.title)
                            .frame(width: 80, height: 40)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                            
                    }
                }.frame(width:250)
                VStack(spacing:0){
                    Text("Clear bet").font(.title3)
                    Button(action: {viewModel.resetBet()} ){
                        Text("✕")
                            .font(.title)
                            .frame(width: 60, height: 60)
                            .foregroundColor(.white)
                    }.background(
                        viewModel.getBet()==0 ? Color.gray : Color.red
                    )
                    .clipShape(Circle())
                    .padding(.vertical,10)
                    .disabled(viewModel.getBet()==0 ? true : false)
                    .buttonStyle(GrowButton())
                    
                }
                
            }.padding(.vertical,15)
            
            HStack(spacing:25){
                ForEach(bets){bet in
                    Button(action: {viewModel.incrementBet(value: bet.amount)}){
                        ZStack{
                            Circle().fill(bet.color).frame(width: 60, height: 60)
                            Circle().stroke(Color.white,lineWidth: 4).frame(width: 60, height: 60)
                            Text(String(bet.amount))
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(width: 60, height: 60)
                        }
                    }.disabled(viewModel.getGameState()==GameState.bet ? false : true)
                    .buttonStyle(GrowButton())
                }
            }.padding(.vertical,15)//.background(Color.black)
            
            if viewModel.getBet() != 0 {
                Button(action: {viewModel.setGameState(state: GameState.start)}){
                    Text("Save bet and start game")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(50)
                        .border(Color.white, width: 2)
                }
            }else{
                Text("Make a bet and start a game")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.black)
            }
            Spacer()
        }
    }
}
struct GrowButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.5 : 1)
            .animation(.easeOut(duration: 0.3),value: configuration.isPressed)
    }
}
private struct Bet: Identifiable{
    let amount: Int
    let color: Color
    var id: String
}

struct BetView_Previews: PreviewProvider {
    static var previews: some View {
        BetView(viewModel: BlackJackViewModel())
    }
}
