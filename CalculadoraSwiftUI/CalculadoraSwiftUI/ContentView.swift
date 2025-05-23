//
//  ContentView.swift
//  CalculadoraSwiftUI
//
//  Created by Andres Landazabal on 2025/05/23.
//

import SwiftUI

struct ContentView: View {
    //Muestra lo que veo en la pantalla de la calculadora
    @State private var display = "0"
    //Guarda el numero antes de presionar (- , +, etc.)
    @State private var firstNumber: Double?
    //Guarda la operacion que se va a realizar
    @State private var currentOperation: String?

    var body: some View {
        
        
        //Apila los elementos verticalmente VStack.
        VStack(spacing: 12) {
            Spacer()

            Text(display)
                .font(.system(size: 64))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
           //HStack los organiza los botones horizontalmente
            HStack {
                Button("7") { appendNumber("7") }
                Button("8") { appendNumber("8") }
                Button("9") { appendNumber("9") }
                Button("÷") { setOperation("/") }
            }

            HStack {
                Button("4") { appendNumber("4") }
                Button("5") { appendNumber("5") }
                Button("6") { appendNumber("6") }
                Button("×") { setOperation("*") }
            }

            HStack {
                Button("1") { appendNumber("1") }
                Button("2") { appendNumber("2") }
                Button("3") { appendNumber("3") }
                Button("−") { setOperation("-") }
            }

            HStack {
                Button("0") { appendNumber("0") }
                
                Button("C") { clear() }
                Button("=") { calculateResult() }
                Button("+") { setOperation("+") }
            }
            
            HStack {
                Button("←") { deleteLastDigit() }
            }
        }
        .font(.largeTitle)
        .buttonStyle(.borderedProminent)
        .padding()
    }

    // MARK: - Funciones

    func appendNumber(_ number: String) {
        if display == "0" {
            display = number
        } else {
            display += number
        }
    }
    //Me elimina el 
    func deleteLastDigit() {
        if display.count > 1 {
            display.removeLast()
        } else {
            display = "0"
        }
    }

    func setOperation(_ op: String) {
        firstNumber = Double(display)
        currentOperation = op
        display = "0"
    }

    func calculateResult() {
        guard let first = firstNumber,
              let second = Double(display),
              let operation = currentOperation else {
            return
        }

        var result: Double = 0

        switch operation {
        case "+": result = first + second
        case "-": result = first - second
        case "*": result = first * second
        case "/": result = second != 0 ? first / second : 0
        default: break
        }

        display = String(result)
        firstNumber = nil
        currentOperation = nil
    }

    func clear() {
        display = "0"
        firstNumber = nil
        currentOperation = nil
    }
}

#Preview {
    ContentView()
}

