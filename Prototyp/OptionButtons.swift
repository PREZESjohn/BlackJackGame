//
//  OptionButtons.swift
//  Prototyp
//
//  Created by student on 27/12/2023.
//

import SwiftUI

struct OptionButtons: View {
    
    @ObservedObject var viewModel: BlackJackViewModel
    
    var body: some View {
        HStack{
            if viewModel.gameState == GameState.start ? true : false {
                customButton(action: viewModel.hit, message: "Hit")
                customButton(action: viewModel.stand, message: "Stand")
            }else{
                customButton(action: viewModel.changeBet, message: "Change bet")
                playAgainButton(vm: viewModel, message: "Play again")
            }
            
        }
    }
    
    func customButton(action: @escaping ()-> Void, message: String) -> some View {
        Button(action: action) {
            Text(message)
        }.buttonStyle(YellowButton())
    }
    
    func playAgainButton(vm: BlackJackViewModel, message: String) -> some View {
        Button(action: vm.startWithSameBet) {
            Text(message)
        }.buttonStyle(ChangeableButton(vm: vm.playerBalance < vm.bet ? true : false))
        .disabled(vm.playerBalance < vm.bet ? true : false)
    }
}

struct YellowButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View{
        configuration.label
            .frame(minWidth:100)
            .font(.title)
            .padding()
            .foregroundColor(.black)
            .background(Color.yellow)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.3), value: configuration.isPressed)
    }
}

struct ChangeableButton: ButtonStyle {
    var vm = true
    func makeBody(configuration: Configuration) -> some View{
        configuration.label
            .frame(minWidth:100)
            .font(.title)
            .padding()
            .foregroundColor(.black)
            .background(vm ? Color.gray : Color.yellow)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.3), value: configuration.isPressed)
    }
}

struct OptionButtons_Previews: PreviewProvider {
    static var previews: some View {
        OptionButtons(viewModel: BlackJackViewModel())
    }
}
