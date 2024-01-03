//
//  InformationDialog.swift
//  Prototyp
//
//  Created by student on 03/01/2024.
//

import SwiftUI

struct InformationDialog: View {
    
    @Binding var isActive:Bool
    let title = "About game"
    let message="""
Overview:

Your goal is to get your deck of cards as close as you can to 21 without going over.

Ace cards can be worth either 1 or 11 points.

Jack, King, and Queen cards are worth 10 points.

Numbered cards 2-10 are worth their value.

Controls:
• Standard tap buttons
• Swipe gesture on player deck:
    ∙ swipe to the left - Hit
    ∙ swipe to the top - Stand
    ∙ swipe to the bottom - Play again with same bet (only if game is finished)

Your turn:

On your turn, you can choose from four options.

Hit - When you hit, you are delt a card. Careful, remember you do not want to exceed 21.

Stand - This action will keep your cards as is and the dealer will take their turn.

Dealer's turn:

The dealer will then take their turn by revealing/dealing cards until it reaches a value greater than or equal to 17.

Outcomes:

You win if:
- Your card count is greater than the dealer's (player bust).
- The dealer's hand count exceeds 21.
- Blackjack! Your first two cards total 21 (and the dealer does not also have a blackjack)

The dealer wins if:
- Your card count if greater than 21 (dealer bust).
- The dealer's card count is greater than yours.
        
"""
    @State private var offset: CGFloat=1000
    
    //TODO: przy szybkich kliknieciach na przycisk, nie pojawia sie okno. Jakby offset nie zdazy sie zresetowac
    var body: some View {
        ZStack{
            Color.black.opacity(0.1)
                .ignoresSafeArea()
                .onTapGesture {
                    close()
                }
            VStack{
                Text(title)
                    .font(.title2)
                    .bold()
                    .padding()
                ScrollView{
                    Text(message)
                        .font(.system(size: 24))
                }
            }.frame(height:500)
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(Color.green)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                VStack{
                    HStack{
                        Spacer()
                        Button(action: {close()})
                         {
                            Image(systemName: "xmark")
                                .font(.title2)
                         }
                    }
                    Spacer()
                }
                .padding()
            )
            .shadow(radius: 20)
            .padding(30)
            .offset(x:0,y:offset)
            .onAppear{
                withAnimation(.spring()){
                    offset=0
                }
            }
        }
    }
    func close(){
        withAnimation(.spring()){
            offset=1000
            isActive=false
        }
    }
}

struct InformationDialog_Previews: PreviewProvider {
    static var previews: some View {
        InformationDialog(isActive: .constant(true))
    }
}
