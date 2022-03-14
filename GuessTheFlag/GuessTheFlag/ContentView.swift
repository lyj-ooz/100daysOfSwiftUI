//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by YJ on 2022/03/10.
//

import SwiftUI

struct FlagImage: View {
    var flag: String
    
    var body: some View {
        Image(flag)
            .renderingMode(.original)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 5)
    }
}

struct GameText: View {
    var text: String
    var color: Color
    var font: Font
    
    var body: some View {
        Text(text)
            .foregroundColor(color)
            .font(font)
        
    }
}

struct ContentView: View {
//    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var countries = ["estonia", "france", "germany", "ireland", "italy", "nigeria", "poland", "russia", "spain", "uk", "us"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreAlertMessage = ""
    @State private var userScore = 0
    @State private var gameCount = 0
    @State private var finishingGame = false
    
    var body: some View {
        ZStack {
//            Color.mint.ignoresSafeArea()
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            Spacer()
            
            VStack {
                GameText(text: "Guess the Flag", color: .white, font: .largeTitle.bold())
                
                VStack(spacing: 15) {
                    VStack {
                        GameText(text: "Tap the flag of", color: .secondary, font: .subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            tapFlag(number)
                        } label: {
                            FlagImage(flag: countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                GameText(text: "Score: \(userScore)", color: .white, font: .title.bold())
                
                Spacer()
            }
            .padding()
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(scoreAlertMessage)
        }
        .alert("End", isPresented: $finishingGame) {
            Button("Reset", action: resetGame)
        } message: {
            Text("End of game. Your final score is \(userScore)")
        }
        
    }
    
    func tapFlag(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 100
            scoreAlertMessage = "Your score is \(userScore)"
        } else {
            scoreTitle = "Wrong"
            if userScore > 0 { userScore -= 100 }
            scoreAlertMessage = "Oops - that's the flag of \(countries[correctAnswer]). Your score is \(userScore)"
        }
        
        showingScore = true
        gameCount += 1
        
        if gameCount == 8 { finishingGame = true }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        gameCount = 0
        userScore = 0
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
