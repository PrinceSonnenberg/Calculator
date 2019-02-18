//
//  calculatorLogic.swift
//  Calculator
//
//  Created by Prince Sonnenberg on 2019/02/09.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?

    mutating func setNumber(_ number: Double){
        self.number = number
        
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
        
            switch symbol {
              case "+/-":
                return n  * -1
        
              case "%":
                return n * 0.01
        
               case "AC":
                return 0
        
                case "=":
                    return performTwoNumberCalculation(n2: n)
        
        default :
            intermediateCalculation = (n1: n, calcMethod: symbol)
        }
    }
        return nil
}
    
  private func performTwoNumberCalculation(n2:Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod{
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            
            default:
                fatalError(" entered operation does not match cases")
            }
            
        }
    
            return nil
    
    }
}








// inheretance is only in classes and not structs
// structs live on the Stack, First in Last out
// classes live in the heap- uses a reference in the stack
// structs are by value classes are by reference type
// structs are immutable
// apple recommend structs by default and changing to class later when inheretance is needed
