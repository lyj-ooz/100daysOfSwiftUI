//
//  ContentView.swift
//  RockPaperScissorsMaster
//
//  Created by YJ on 2022/03/14.
//

import SwiftUI

struct ContentView: View {
    private let game = ["Rock", "Paper", "Scissors"]
    private var result = ["Win", "Lose"]
    @State private var computerNum = Int.random(in: 0...2)
    @State private var playerShouldWin = Bool.random()
    @State private var score = 0
    @State private var gameRound = 1
    @State private var userChoice = "Rock"
    @State private var showGameEndAlert = false
    
    var body: some View {
        VStack {
            Text("Round: \(gameRound) / 10")
                .font(.title)
                .foregroundColor(.gray)
            Spacer()

            Text("Computer chose \(game[computerNum])")
                .font(.title)
            Text("You should \(playerShouldWin ? "win" : "lose")")
                .font(.title.bold())

            VStack {
                ForEach(0..<game.count) { number in
                    Button(game[number]) {
                        userChoice = game[number]
                        print("user chose.. \(game[number])")
                        playerResult()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .border(.gray)
                }
            }
            .padding()
            
            Spacer()
            
            Text("Score: \(score)")

            Spacer()
        }
        .alert("Game End", isPresented: $showGameEndAlert) {
            Button("OK", action: resetGame)
        } message: {
            Text("Your final score is \(score)")
        }
    }
    
    func playerResult() {
        if playerShouldWin {
            if (game[computerNum] == "Rock" && userChoice == "Paper") || (game[computerNum] == "Paper" && userChoice == "Scissors") || (game[computerNum] == "Scissors" && userChoice == "Rock") {
                score += 100
            } else {
                score = score == 0 ? 0 : score - 100
            }
            
        } else {
            if (game[computerNum] == "Rock" && userChoice == "Scissors") || (game[computerNum] == "Paper" && userChoice == "Rock") || (game[computerNum] == "Scissors" && userChoice == "Paper") {
                score += 100
            } else {
                score = score == 0 ? 0 : score - 100
            }
        }
        
        bringNextRound()
    }
    
    func bringNextRound() {
        if gameRound == 10 {
            showGameEndAlert = true
            return
        }
        
        gameRound += 1
        computerNum = Int.random(in: 0...2)
        playerShouldWin = Bool.random()
    }
    
    func resetGame() {
        gameRound = 1
        score = 0
        computerNum = Int.random(in: 0...2)
        playerShouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    init(hex string: String) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }

        // Double the last value if incomplete hex
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }

        // Fix invalid values
        if string.count > 8 {
            string = String(string.prefix(8))
        }

        // Scanner creation
        let scanner = Scanner(string: string)

        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        if string.count == 2 {
            let mask = 0xFF

            let g = Int(color) & mask

            let gray = Double(g) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)

        } else if string.count == 4 {
            let mask = 0x00FF

            let g = Int(color >> 8) & mask
            let a = Int(color) & mask

            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)

        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)

        } else if string.count == 8 {
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask

            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)

        } else {
            self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
        }
    }
}
