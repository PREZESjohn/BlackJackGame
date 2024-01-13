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
            Spacer()
            logoView
            Spacer()
            betStatus
            betOptions
            Spacer()
            startButtonPanel
            Spacer()
        }
    }
    
    var betOptions: some View {
        HStack(spacing:25) {
            ForEach(bets) {bet in
                Button(action: {viewModel.incrementBet(value: bet.amount)}){
                    ZStack{
                        Circle()
                            .fill(bet.color)
                            .frame(width: 60, height: 60)
                        Circle()
                            .stroke(Color.white,lineWidth: 4)
                            .frame(width: 60, height: 60)
                        Text(String(bet.amount))
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 60, height: 60)
                    }
                }.disabled(viewModel.gameState == GameState.bet ? false : true)
                    .buttonStyle(GrowButton())
            }
        }.padding(.vertical, 15)
    }
    
    var logoView: some View {
        VStack{
            Text("BlackJack")
                .font(.system(size: 80))
                .bold()
            Text("Card Game")
                .font(.largeTitle)
        }
    }
    
    var betStatus: some View {
        HStack{
            VStack{
                HStack() {
                    Text("Player balance")
                        .font(.title)
                    Spacer()
                    Text(String(viewModel.playerBalance))
                        .frame(width: 100, height: 40)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .background(Color.white)
                }
                HStack(){
                    Text("Bet")
                        .font(.title)
                    Spacer()
                    Text(String(viewModel.bet))
                        .frame(width: 100, height: 40)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .background(Color.white)
                
                }
            }.font(.title)
                .frame(width:250)
            
            VStack(spacing:0){
                Text("Clear bet")
                    .font(.title3)
                Button(action: {viewModel.resetBet()}) {
                    Text("✕")
                        .font(.title)
                        .frame(width: 60, height: 60)
                        .foregroundColor(.white)
                        .background(viewModel.bet == 0 ? Color.gray : Color.red)
                        .clipShape(Circle())
                }.padding(.vertical, 10)
                .disabled(viewModel.bet == 0 ? true : false)
                .buttonStyle(GrowButton())
            }
        }.padding(.vertical,15)
    }
    
    var startButtonPanel: some View {
        VStack{
            if viewModel.bet != 0 {
                Button(action: {viewModel.setGameState(state: GameState.start)}) {
                    Text("Save bet and start game")
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.yellow)
                        .clipShape(Capsule())
                }
            } else if viewModel.playerBalance != 0 {
                Text("Make a bet and start a game")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.black)
            } else {
                Text("You have lost all your money.")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .foregroundColor(.black)
                Button(action: {viewModel.restartGame()}) {
                    Text("Restart Game")
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.yellow)
                        .clipShape(Capsule())
                }
            }
        }.frame(height: 150)
    }
}

struct GrowButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.5 : 1)
            .animation(.easeOut(duration: 0.3), value: configuration.isPressed)
    }
}

private struct Bet: Identifiable {
    let amount: Int
    let color: Color
    var id: String
}

struct BetView_Previews: PreviewProvider {
    static var previews: some View {
        BetView(viewModel: BlackJackViewModel()).background(Color.green)
    }
}
