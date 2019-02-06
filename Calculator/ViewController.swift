//
//  ViewController.swift
//  Calculator
//
//  Created by Prince Sonnenberg on 06/02/2019.
//  Copyright © 2019 Prince Sonnenberg . All rights reserved.
//  App layout courtesy London App Brewery.

import UIKit

class ViewController: UIViewController {
    
    
    
    var inputNumbers =  [Double]()
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var isFinishedTypingNumber: Bool = true
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
    
        
        if let numValue =  sender.currentTitle {
            
            if isFinishedTypingNumber {
                
                displayLabel.text = numValue
                
                isFinishedTypingNumber = false
            }
            
            else {
                
                    displayLabel.text = displayLabel.text! + numValue
            
            }
            
        }
        
        
        
    }

}

