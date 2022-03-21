//
//  ContentView.swift
//  Basic2
//
//  Created by YJ on 2022/03/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.09, green: 0.63, blue: 0.52, opacity: 1.0)
                .ignoresSafeArea()
            
            VStack {
                Image("lyj")
                    .resizable()
                // to keep aspect ratio
                    .aspectRatio(nil, contentMode: .fit)
                    .frame(width: 150, height: 120)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(.white, lineWidth: 3)
                    )
                
                Text("YJ LEE")
                    .font(Font.custom("Oxygen-Bold", size: 30))
                    .foregroundColor(.white)
                
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                
                Divider()
                
                InfoView(info: "+82 010-1111-2222", iconName: "phone.fill")
                InfoView(info: "yjlee1026@yahoo.com", iconName: "envelope.fill")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


