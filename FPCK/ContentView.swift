//
//  ContentView.swift
//  FPCK
//
//  Created by Edmond Podlegaev on 04.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var fat: Double = 0.0
    @State private var protein: Double = 0.0
    @State private var carbohydrates: Double = 0.0
    @State private var kcal: Double = 0.0

    @State private var defaultG: Int = 0
    @State private var userG: Int = 0
    
    @State private var isCalculate: Bool = false
    @FocusState private var isFocused: Bool
    
    var result: [Double] {
        
        let delta: Double = Double(userG - defaultG)
        let result: [Double] = [fat * delta, protein * delta, carbohydrates * delta, kcal * delta]
        
        return result
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        TextField("Fat", value: $fat, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($isFocused)
                        TextField("Protein", value: $protein, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($isFocused)
                        TextField("Carbohydrates", value: $carbohydrates, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($isFocused)
                        TextField("Kcal", value: $kcal, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($isFocused)
                    } header: {
                        Text("Add characteristics for your food")
                    }
                    
                    Section {
                        TextField("G-Default", value: $defaultG, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($isFocused)
                        TextField("G-User", value: $userG, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($isFocused)
                    } header: {
                        Text("How much you wanna eat?")
                    }
                    
                    Section {
                        Button("Calculate") {
                            isCalculate.toggle()
                        }
                    }
                }
            }
            .navigationTitle("FPCK")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
            .alert(
                "Your result: \n Fat: \(result[0]) \n Protein: \(result[1]) \n Carbohydrates: \(result[2]) \n Kcal: \(result[3])",
                isPresented: $isCalculate
            ) {}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
