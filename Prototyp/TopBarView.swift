//
//  TopBarView.swift
//  Prototyp
//
//  Created by student on 03/01/2024.
//

import SwiftUI

struct TopBarView: View {
    
    @ObservedObject var viewModel: BlackJackViewModel
    @Binding var popUpActive: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            HStack() {
                playerBalance
                Spacer()
                playerBet
                Spacer()
                informationButton
            }
        }.font(.title)
            .foregroundColor(.black)
            .padding()
            .background(Color.yellow)
    }
    
    var playerBalance: some View {
        HStack {
            Text("$:")
                .fixedSize(horizontal: false, vertical: true)
            Text(String(viewModel.playerBalance))
                .frame(width: 80, height: 40)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        }
    }
    
    var playerBet: some View {
        HStack {
            Text("Bet:")
            Text(String(viewModel.bet))
        }
    }
    
    var informationButton: some View {
        Button(action: {popUpActive = true}) {
            Text("ℹ︎")
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .background(
                    LinearGradient(gradient:Gradient(colors: [.black,.blue]), startPoint: .bottomTrailing,
                        endPoint: .topLeading)
                ).clipShape(Circle())
        }
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView(viewModel: BlackJackViewModel(), popUpActive: .constant(false))
    }
}
