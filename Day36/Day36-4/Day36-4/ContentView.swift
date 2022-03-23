//
//  ContentView.swift
//  Day36-4
//
//  Created by YJ on 2022/03/23.
//

import SwiftUI

struct ContentView: View {
//    @State private var tapNumber = UserDefaults.standard.integer(forKey: "Tap")
    
    @AppStorage("Tap") private var tapNumber = 0
    
    var body: some View {
        Button("Tap here! \(tapNumber)") {
            tapNumber += 1
//            UserDefaults.standard.set(tapNumber, forKey: "Tap")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
