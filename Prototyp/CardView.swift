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


        HStack(spacing:0){
                if isFaceUp {
                    VStack{
                        Text(rank).font(.largeTitle).foregroundColor(Color.yellow)
                        Text(color).font(.largeTitle).foregroundColor(Color.yellow)
                        Spacer()
                    }.padding([.leading,.top],6).frame(width: 45)
                    Text(color).font(.system(size: 50))
                        .minimumScaleFactor(0.1)
                        .foregroundColor(Color.yellow)
                        .shadow(color: .orange, radius: 1.5, x: 5, y: 5)
                        .frame(width: 50)
                    VStack{
                        Text(rank).font(.largeTitle).foregroundColor(Color.yellow)
                        Text(color).font(.largeTitle).foregroundColor(Color.yellow)
                        Spacer()
                    }.rotationEffect(.degrees(180)).padding([.trailing,.bottom],6).frame(width: 45)

                }else{
                    Image(uiImage: UIImage(named: "back_of_card")!)
                        .frame(width: 125, height: 210)
                }
            }
            .background(Color.black).cornerRadius(30).aspectRatio(2/3,contentMode: .fit)
            .minimumScaleFactor(0.01)
            //.frame( idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            .frame(width: 150, height: 225)
    }
    
    var middlePosition: some View{
        HStack(spacing: 40){
//            let elem=["A","K","Q","J"]
//            let left=colorScheme(position: "left")
//            let center=colorScheme(position: "center")
//            let right=colorScheme(position: "right")
////            if elem.contains(rank){
                VStack{
                    Text(color).font(.system(size: 100))
                        .minimumScaleFactor(0.5)
                        .aspectRatio(10/9,contentMode: .fit).foregroundColor(Color.yellow)
                                                    .shadow(color: .orange, radius: 1.5, x: 5, y: 5)
                }
//            }else{
//                VStack(spacing: 40){
//                    if left != 0 {
//                        ForEach(1...left, id:\.self){c in
//                            Text(color).font(.system(size: 20)).foregroundColor(Color.yellow)
//                        }
//                    }
//
//                }
//                VStack(spacing: 80){
//                    if center != 0 {
//                        ForEach(1...center, id:\.self){c in
//                            Text(color).font(.system(size: 20)).foregroundColor(Color.yellow)
//                        }
//                    }
//                }
//                VStack(spacing: 40){
//                    if right != 0 {
//                        ForEach(1...right, id:\.self){c in
//                            Text(color).font(.system(size: 20)).foregroundColor(Color.yellow)
//                        }
//                    }
//                }
//
            }
//        }.frame(width: 120)
    }
    func colorScheme(position: String)->Int{
        let rankInt:Int=Int(rank) ?? 0
        var left=rankInt / 2
        var center=0
        var right=rankInt / 2
        if (rankInt>=2 && rankInt<=3) {
            center=rankInt
        }
        if rankInt>=4 && rankInt<=6 {
            center=rankInt % 2
        }
        if rankInt>=7 && rankInt<=8{
            center=rankInt % 3
        }
        if rankInt==9{
            left=rankInt / 2
            center=rankInt % 4
            right=rankInt / 2
        }
        if rankInt==10{
            left=4
            center=2
            right=4
        }
        switch position{
        case "left":
            return left
        case "center":
            return center
        case "right":
            return right
        default:
            return 0
        }
        
    }
}




struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
