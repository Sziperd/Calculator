

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
        
        private var displayValue: Double {
            get {
                if displayLabel.text! == "."{
                    return 0.0
                }else {
                
                guard let number = Double(displayLabel.text!) else {
                    fatalError("Cannot convert display label text to a Double.")
                }
                return number
            }
            }
            set {
                displayLabel.text = String(newValue)
            }
            }
        
    
   private var calculator = CalculatorLogic()
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        
    
        if let calcMethod = sender.currentTitle{
            
           
            if let result = calculator.calculate(symbol: calcMethod){
                //fatalError()
            
           displayValue =  result
            
        }
        }
        
        
        
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
    
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {
                    
                    let test = displayLabel.text! + ".0"
                    
                    let isInt = floor(displayValue) == displayValue && displayValue == Double(test)
                    
                    if !isInt {
                        return
                    }
                  
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }

}

