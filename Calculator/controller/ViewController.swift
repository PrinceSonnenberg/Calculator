//
//  ViewController.swift
//  Calculator
//
//  Created by Prince Sonnenberg on 06/02/2019.
//  Copyright © 2019 Prince Sonnenberg . All rights reserved.
//  App layout courtesy London App Brewery.

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        
        get {
            
            guard let number = Double(displayLabel.text!) else {
                
            fatalError("cannot convert display label text to double")
           
            }
            
            return number
            
        }
        set {
            
            displayLabel.text =  String(newValue)
            
        }
        
    }
    
//MARK:- What should happen when a non-number button is pressed
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
    
        if let calcMethod =  sender.currentTitle {
            
            let calculator = CalculatorLogic(number: displayValue)
           
            guard let result = calculator.calculate(symbol: calcMethod) else {
                
                fatalError("result of calculation is nil")
            }
            
            displayValue = result
            
        }

    }

    


//MARK:- What should happen when a number is entered into the keypad
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue =  sender.currentTitle {
            
            if isFinishedTypingNumber {
                
                displayLabel.text = numValue
                
                isFinishedTypingNumber = false
            }
            
            else {
                
                if numValue == "."{
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        
                        return
                        
                    }
                }
                
                    displayLabel.text = displayLabel.text! + numValue
            
            }
            
        }
        
        
        
    }

}

// swift has 5 levels of access!! [Priate, fileprivate, internal(default settings)], public,open
// by default create private vars and lets then move to internal. Dont use open or public
