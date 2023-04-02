//
//  ViewController.swift
//  lucky-tipsy
//
//  Created by Dauletkhanova Saniya.
//

import UIKit

class CalculatorViewController: UIViewController, UITextViewDelegate  {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.0
    var calculatedAmount = 0.0
    var numberOfPeople = 0
    var finalResult = ""
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        
        switch sender {
        case zeroPctButton:
            tip = 0.0
        case tenPctButton:
            tip = 0.1
        default:
            tip = 0.2
        }
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {

        let percentage = 1 + tip
        numberOfPeople = Int(splitNumberLabel.text!)!
        let total = Double(billTextField.text ?? "0.0") ?? 0.0
        
        calculatedAmount = total * percentage/Double(numberOfPeople)
        finalResult = String(format: "%.2f", calculatedAmount)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tip = Int(tip * 100)
            destinationVC.numberOfPeople = numberOfPeople
            destinationVC.total = finalResult
        }
    }
    
}
