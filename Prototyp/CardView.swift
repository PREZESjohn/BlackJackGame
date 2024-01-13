//
//  CardView.swift
//  Prototyp
//
//  Created by student on 17/12/2023.
//
import Foundation
import SwiftUI

struct CardView: View {
    var rank: String = "10"
    var color: String = "♥︎"
    var isFaceUp: Bool=true
    
    
    var body: some View {
       cardContent
        .background(Color.black)
        .cornerRadius(30)
        .aspectRatio(2/3,contentMode: .fit)
        .minimumScaleFactor(0.01)
        .frame(width: 150, height: 225)
        .rotation3DEffect(.degrees(isFaceUp ? 0 : 180), axis:(0,1,0))
        .animation(.linear(duration: 0.5), value: isFaceUp)
    }
    
    var cardContent: some View {
        ZStack() {
            HStack(spacing: 0) {
                cardCorner
                    .padding([.leading, .top] ,6)
                    .frame(width: 45)
                cardMiddle
                cardCorner
                    .rotationEffect(.degrees(180))
                    .padding([.trailing, .bottom], 6)
                    .frame(width: 45)
            }.opacity(isFaceUp ? 1 : 0)
            
            Image(uiImage: UIImage(named: "back_of_card")!)
                                    .frame(width: 125, height: 210)
                                    .opacity(isFaceUp ? 0 : 1)
        }
    }
    
    var cardCorner: some View {
        VStack {
            Text(rank)
            Text(color)
            Spacer()
        }.font(.largeTitle)
            .foregroundColor(Color.yellow)
    }
    
    var cardMiddle: some View {
        Text(color)
            .font(.system(size: 50))
            .minimumScaleFactor(0.1)
            .foregroundColor(Color.yellow)
            .shadow(color: .orange, radius: 1.5, x: 5, y: 5)
            .frame(width: 50)
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
