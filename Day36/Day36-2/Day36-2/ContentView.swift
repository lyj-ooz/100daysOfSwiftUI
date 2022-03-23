//
//  ContentView.swift
//  Day36-2
//
//  Created by YJ on 2022/03/23.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        Button("dismiss this view") {
            dismiss()
        }
    }
}

struct ContentView: View {
    @State private var isShowingSheet = false
    
    var body: some View {
        Button("Show sheet") {
            isShowingSheet.toggle()
        }
        .sheet(isPresented: $isShowingSheet) {
            SecondView(name: "Hello world!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
