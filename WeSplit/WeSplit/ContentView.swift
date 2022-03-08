//
//  ContentView.swift
//  WeSplit
//
//  Created by YJ on 2022/03/08.
//

import SwiftUI

struct ContentView: View {
    
    private let tipPercentages = [10, 15, 20, 25, 0]
    private let currencyFomatter: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currencyCode ?? "USD")
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 15
    @FocusState private var amountIsFocused: Bool
    
    var totalAmountWithTip: Double {
        let tipSelection = Double(tipPercentage)
        return checkAmount * (1.0 + tipSelection/100.0)
    }
    
    var totalPerPersen: Double {
        let peopleCount = Double(numberOfPeople + 2)
//        let tipSelection = Double(tipPercentage)
//        return checkAmount * (1.0 + tipSelection/100.0) / peopleCount
        return totalAmountWithTip / peopleCount
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: currencyFomatter)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<20) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalAmountWithTip, format: currencyFomatter)
                } header: {
                    Text("Total amount with tip")
                }
                
                Section {
                    Text(totalPerPersen, format: currencyFomatter)
                } header: {
                    Text("Amount per person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
