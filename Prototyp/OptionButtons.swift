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
                customButton(action: viewModel.hit, message:"Hit")
                customButton(action: viewModel.stand, message: "Stand")
            }else{
                customButton(action: viewModel.startOver, message: "Change bet")
                customButton(action: viewModel.startWithSameBet, message: "Play again").disabled(viewModel.playerBalance<=viewModel.getBet() ? true : false)
            }
            
        }
    }

    func customButton(action: @escaping ()-> Void, message: String) -> some View {
        Button(action: action){
            Text(message)
        }.buttonStyle(YellowButton())
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
