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
        .background(Color(red: 0.2, green: 0.75, blue: 0.16)
            .ignoresSafeArea()
        )
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: BlackJackViewModel())
    }
}
