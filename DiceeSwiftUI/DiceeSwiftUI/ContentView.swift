//
//  ContentView.swift
//  DiceeSwiftUI
//
//  Created by YJ on 2022/03/22.
//

import SwiftUI

struct ContentView: View {
    @State private var leftDiceNumber = 1
    @State private var rightDiceNumber = 1
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                
            VStack {
                Spacer()
                
                Image("diceeLogo")
                
                Spacer()
                
                HStack {
                    DiceView(number: leftDiceNumber)
                    DiceView(number: rightDiceNumber)
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button("Role!") {
                    leftDiceNumber = Int.random(in: 1...6)
                    rightDiceNumber = Int.random(in: 1...6)
                }
                .font(.largeTitle.bold())
                .padding()
                .foregroundColor(.white)
                .background(.red)
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiceView: View {
    let number: Int
    
    var body: some View {
        Image("dice\(number)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .frame(width: 120, height: 120)
            .padding()
    }
}
