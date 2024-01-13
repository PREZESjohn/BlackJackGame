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
    @State var popUpActive: Bool = false
    
    var body: some View {
        ZStack() {
            if viewModel.gameState == GameState.bet {
                BetView(viewModel: viewModel)
            } else {
                GameView(viewModel: viewModel, popUpActive: $popUpActive)
            }
            if popUpActive {
                InformationDialog(isActive: $popUpActive)
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(
            LinearGradient(gradient:Gradient(colors: [.blue,.green,.blue]),
                startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
        )
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: BlackJackViewModel())
    }
}
