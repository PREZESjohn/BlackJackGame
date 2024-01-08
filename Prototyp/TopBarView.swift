//
//  TopBarView.swift
//  Prototyp
//
//  Created by student on 03/01/2024.
//

import SwiftUI

struct TopBarView: View {
    @ObservedObject var viewModel: BlackJackViewModel
    @Binding var popUpActive:Bool
    var body: some View {
        VStack(alignment:.center){
            HStack(){
                Text("$:")
                    .font(.title)
                    .fixedSize(horizontal: false, vertical: true)
                Text(String(viewModel.getPlayerBalance()))
                    .font(.title)
                    .frame(width: 80, height: 40)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                Text("Bet:").font(.title)
                Text(String(viewModel.getBet()))
                    .font(.title)
                Spacer()
                Button(action:{popUpActive=true}){
                    Text("ℹ︎")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .background(
                            LinearGradient(gradient:Gradient(colors: [.black,.blue]),
                                startPoint: .bottomTrailing,
                                endPoint: .topLeading)
                        )
                        .clipShape(Circle())
                }
            }
        }
        .padding()
        .background(
            LinearGradient(gradient:Gradient(colors: [.green,.blue,.blue]),
                           startPoint: .bottomTrailing,
                           endPoint: .topLeading)
            .ignoresSafeArea()
        )
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView(viewModel: BlackJackViewModel(), popUpActive: .constant(false))
    }
}
