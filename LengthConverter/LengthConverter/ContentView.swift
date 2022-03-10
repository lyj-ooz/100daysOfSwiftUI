//
//  ContentView.swift
//  LengthConverter
//
//  Created by YJ on 2022/03/09.
//

import SwiftUI

struct ContentView: View {
    private let unitArr = ["m", "km", "feet", "yards", "miles"]
    @State private var inputUnit = "m"
    @State private var outputUnit = "feet"
    @State private var inputValue = 100.0
    @FocusState private var textFieldFocused: Bool
    
    private var convertResult: Double {
        if inputUnit == outputUnit {
            return inputValue
        }
        
        if inputUnit == "m" {
            if outputUnit == "km" { return inputValue / 1000.0 }
            if outputUnit == "feet" { return inputValue * 3.281 }
            if outputUnit == "yards" { return inputValue * 1.094 }
            if outputUnit == "miles" { return inputValue / 1609 }
        }
        
        if inputUnit == "km" {
            if outputUnit == "m" { return inputValue * 1000.0 }
            if outputUnit == "feet" { return inputValue * 3281.0 }
            if outputUnit == "yards" { return inputValue * 1094 }
            if outputUnit == "miles" { return inputValue / 1.609 }
        }
        
        if inputUnit == "feet" {
            if outputUnit == "m" { return inputValue / 3.281 }
            if outputUnit == "km" { return inputValue / 3281.0 }
            if outputUnit == "yards" { return inputValue / 3.0 }
            if outputUnit == "miles" { return inputValue / 5280.0 }
        }
        
        if inputUnit == "yards" {
            if outputUnit == "m" { return inputValue / 1.094 }
            if outputUnit == "km" { return inputValue / 1094.0 }
            if outputUnit == "feets" { return inputValue * 3.0 }
            if outputUnit == "miles" { return inputValue / 1760.0 }
        }
        
        if inputUnit == "miles" {
            if outputUnit == "m" { return inputValue * 1609.0 }
            if outputUnit == "km" { return inputValue * 1.609 }
            if outputUnit == "feet" { return inputValue * 5280.0 }
            if outputUnit == "yards" { return inputValue * 1760 }
        }
        
        return 0.0
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(unitArr, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Choose input unit")
                }
                
                Section {
                    TextField("your value..", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($textFieldFocused)
                } header: {
                    Text("Your value")
                }
                
                Section {
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(unitArr, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Choose output unit")
                }
                
                Section {
                    Text(convertResult, format: .number)
                        .padding()
                }
            }
            .navigationTitle("Length Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        textFieldFocused = false
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
