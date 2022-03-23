//
//  ContentView.swift
//  Day36-3
//
//  Created by YJ on 2022/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 0
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) { n in
                        Text("row \(n)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add a number") {
                    currentNumber += 1
                    numbers.append(currentNumber)
                }
            }
            .navigationTitle("onDelete()")
            .toolbar {
                EditButton()
            }
        }
        
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
