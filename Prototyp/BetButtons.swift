//
//  BetButtons.swift
//  Prototyp
//
//  Created by student on 28/12/2023.
//

import SwiftUI

struct BetButtons: View {
    private let bets: [Bet]=[
        Bet(amount: 5, color: .red,id: "5"),
        Bet(amount: 20, color: .yellow,id: "20"),
        Bet(amount: 50, color: .blue,id: "50"),
        Bet(amount: 200, color: .orange,id: "200")
    ]
    @ObservedObject var viewModel: BlackJackViewModel
    
    var body: some View {
        VStack{
            Text(String(viewModel.getBet()))
                .frame(width: 60, height: 40)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            Button(action: {viewModel.resetBet()} ){
                Text("✕")
                    .font(.title)
                    .frame(width: 60, height: 60)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }.padding(.vertical,10)
            
            ForEach(bets){bet in
                Button(action: {viewModel.setBet(value: bet.amount)}){
                    Text(String(bet.amount))
                        .font(.title)
                        .frame(width: 60, height: 60)
                        .background(bet.color)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
            }
            
        }
    }
}

private struct Bet: Identifiable{
    let amount: Int
    let color: Color
    var id: String
}

struct BetButtons_Previews: PreviewProvider {
    static var previews: some View {
        BetButtons(viewModel: BlackJackViewModel())
    }
}