//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by YJ on 2022/03/10.
//

import SwiftUI

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
                Text("Guess the Flag")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            tapFlag(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(userScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
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
