//
//  ContentView.swift
//  Animations
//
//  Created by YJ on 2022/03/17.
//

import SwiftUI

struct ContentView: View {
    let letters = Array("from October.")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var showingBlue = false
    @State private var animationAmount = 1.0
    @State private var explicitAnimationAmount = 0.0
    
    // day32 implicit & explicit animations
    // 1. apply animation() modifier to a view
    var body: some View {
//        Button("Tap here") {
//            animationAmount += 0.3
//        }
//        .padding(40)
//        .background(.blue)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .scaleEffect(animationAmount)
//        .animation(.default, value: animationAmount)
//        .animation(.easeOut, value: animationAmount)
//        .animation(.easeOut(duration: 5), value: animationAmount)
//        .animation(
//            .easeOut(duration: 5)
//                .delay(1),
//            value: animationAmount
//        )
//        .animation(
//            .easeOut(duration: 2)
//                .repeatCount(3),
//            value: animationAmount
//        )
//          .animation(
//              .easeOut(duration: 1)
//                .repeatCount(3, autoreverses: true),
//              value: animationAmount
//          )
//          .animation(
//            .easeOut(duration: 0.5)
//                .repeatForever(autoreverses: true),
//              value: animationAmount
//          )
//        .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
        
        // cool animation
        /*
        Button("Tap here") {
            
        }
        .padding(50)
        .background(.mint)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.mint)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
        */
        
        
        // 2. apply animation() modifier to a binding
        /*
        print(animationAmount)
        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10)

            Spacer()

            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
        */
        
        // 3. creating explicit animations ('withAnimation')
        Button("Tap Me") {
            /*
            withAnimation {
                explicitAnimationAmount += 360
            }
            */
            
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                explicitAnimationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(explicitAnimationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
