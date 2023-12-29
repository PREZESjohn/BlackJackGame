//
//  OptionButtons.swift
//  Prototyp
//
//  Created by student on 27/12/2023.
//

import SwiftUI

//przyciski z opcjami do dobrania karty lub potwierdzenia reki. Podczas uzyskania wyniku, wyswietla przycisk do restartu gry
struct OptionButtons: View {
    
    @ObservedObject var viewModel: BlackJackViewModel
    
    var body: some View {
        HStack{
            if viewModel.getGameState()==GameState.start ? true : false {
                Button(action: viewModel.hit){
                    Text("Hit")
                        .font(.largeTitle)
                        .frame(width: 100, height: 52)
                        .background(Color.yellow)
                        .cornerRadius(10)
                }
                Button(action: viewModel.stand){
                    Text("Stand")
                        .font(.largeTitle)
                        .frame(width: 100, height: 52)
                        .background(Color.yellow)
                        .cornerRadius(10)
                }
            }else{
                Button(action: viewModel.startOver){
                    Text("Play again")
                        .font(.largeTitle)
                        .frame(width: 100, height: 52)
                        .background(Color.yellow)
                        .cornerRadius(10)
                }
            }
            
        }
    }
}

struct OptionButtons_Previews: PreviewProvider {
    static var previews: some View {
        OptionButtons(viewModel: BlackJackViewModel())
    }
}
