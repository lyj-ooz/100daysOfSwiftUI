//
//  ContentView.swift
//  Day36-5
//
//  Created by YJ on 2022/03/23.
//

import SwiftUI

struct User: Codable {
    let firstname: String
    let lastname: String
}

struct ContentView: View {
    @State private var user = User(firstname: "Taylor", lastname: "Swift")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
