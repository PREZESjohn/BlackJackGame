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
                }.buttonStyle(YellowButton())
                Button(action: viewModel.stand){
                    Text("Stand")
                }.buttonStyle(YellowButton())
            }else{
                Button(action: viewModel.startOver){
                    Text("Change bet")
                }.buttonStyle(YellowButton())
                Button(action: viewModel.startWithSameBet){
                    Text("Play again")
                }.buttonStyle(YellowButton())
                
            }
            
        }
    }
}
struct YellowButton: ButtonStyle {
    func makeBody(configuration: Configuration)->some View{
        configuration.label
            .frame(minWidth:100)
            .font(.title)
            .padding()
            .foregroundColor(.black)
            .background(Color.yellow)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.3),value: configuration.isPressed)
    }
}

struct OptionButtons_Previews: PreviewProvider {
    static var previews: some View {
        OptionButtons(viewModel: BlackJackViewModel())
    }
}
