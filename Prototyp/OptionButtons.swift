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
            Button(action: viewModel.hit){
                Text("Hit")
                    .font(.largeTitle)
                    .frame(width: 100, height: 52)
                    .background(Color.yellow)
                    .cornerRadius(10)
            }
            Button(action: viewModel.stay){
                Text("Stay")
                    .font(.largeTitle)
                    .frame(width: 100, height: 52)
                    .background(Color.yellow)
                    .cornerRadius(10)
            }
        }
    }
}

struct OptionButtons_Previews: PreviewProvider {
    static var previews: some View {
        OptionButtons(viewModel: BlackJackViewModel())
    }
}
