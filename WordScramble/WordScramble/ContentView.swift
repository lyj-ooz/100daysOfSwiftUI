//
//  ContentView.swift
//  WordScramble
//
//  Created by YJ on 2022/03/15.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .toolbar(content: {
                Button("New word") {
                    loadFile()
                    usedWords = []
                }
            })
            .onSubmit(addNewWord)
            .onAppear(perform: loadFile)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isValidWord(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func isEnoughLength(word: String) -> Bool {
        return word.count > 2
    }
    
    func isDifferentWithRoot(word: String) -> Bool {
        return word != rootWord
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        // validation 1~5
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original..!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell '\(answer)' from '\(rootWord)'")
            return
        }
        
        guard isValidWord(word: answer ) else {
            wordError(title: "Word not recognized", message: "Please use a valid word")
            return
        }
        
        guard isEnoughLength(word: answer) else {
            wordError(title: "Word not long enough", message: "Please use a word longer than 2 letters")
            return
        }
        
        guard isDifferentWithRoot(word: answer) else {
            wordError(title: "Word same as '\(rootWord)'", message: "You can be more creative than copying '\(rootWord)'!")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        newWord = ""
    }
    
    func loadFile() {
        if let fileURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            
            if let fileContents = try? String(contentsOf: fileURL) {
                let words = fileContents.components(separatedBy: "\n")
                rootWord = words.randomElement() ?? "scramble"
                return
            }
        }
        
        fatalError("Count not load start.txt from bundle.")
    }
    
    /*
    func test() {
        // 1. break a string into an array
        let input1 = "a b c"
        let letters1 = input1.components(separatedBy: " ")
        
        let input2 = """
                    a
                    b
                    c
                    """
        let letters = input2.components(separatedBy: "\n")
        let randomLetter = letters.randomElement()
        
        // 2. remove whitespace
        let trimmed = randomLetter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // 3. check for spelling errors
        let word = "swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
    }
    */
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
