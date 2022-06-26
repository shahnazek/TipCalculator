//
//  ViewController.swift
//  TipCalculator
//
//  Created by Shahnaz EK on 21/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    let percentage = "%"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    
    @IBAction func tipStepperChanged(_ sender: UIStepper) {
        
        billTextField.endEditing(true)
        
        tipLabel.text = String(format: "%.0f", sender.value) + percentage
        let stepperValue = sender.value
        tip = stepperValue / 100
    }
    
    
    @IBAction func splitStepperChanged(_ sender: UIStepper) {
        
        splitLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        if bill != " " {
            if let billTotal = Double(bill){
                let result = billTotal * (1 + tip) / Double(numberOfPeople)
                finalResult = String(format: "%.2f", result)
                billTextField.text = nil
            }
        }
        
        self.performSegue(withIdentifier: "FinalTipCount", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {  //checking the segue that was called
        if segue.identifier == "FinalTipCount" {
           
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
            

}
}
    
}
