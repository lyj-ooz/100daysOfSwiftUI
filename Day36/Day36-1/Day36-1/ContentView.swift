//
//  ContentView.swift
//  Day36-1
//
//  Created by YJ on 2022/03/23.
//

import SwiftUI

//struct User {
//    var firstname = "Jill"
//    var lastname = "Goodacre"
//}

class User: ObservableObject {
    @Published var firstname = "Jill"
    @Published var lastname = "Goodacre"
    var someProperty = "not going to change this one"
}

struct ContentView: View {
//    @State private var user = User()
    @StateObject var user = User()
    
    var body: some View {
        VStack {
            Text("User's name: \(user.firstname) \(user.lastname)")
                .padding()
            
            TextField("First name", text: $user.firstname)
            TextField("Last name", text: $user.lastname)
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
