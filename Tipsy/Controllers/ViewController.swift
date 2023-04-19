//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var billTextField: UITextField!
    
    @IBOutlet var zeroPctButtton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    
    @IBOutlet var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var totalBill = 0.0
    var numberOfPeople = 0
    var resultFormated = "No Bill"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func tipButton(_ sender: UIButton) {
        
        zeroPctButtton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle ?? "NO Title"
        
        //Remove the last character (%) from the title then turn it back into a String.
                let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        
        //Turn the String into a Double.
                let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
                
                //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
                tip = buttonTitleAsANumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        let billamount = billTextField.text ?? "0"

        totalBill = Double(billamount) ?? 0
        
        let totalAmount = totalBill * (1 + tip)

        let result = totalAmount / Double(numberOfPeople)
        
          resultFormated = String(format: "%.2f", result)
        
        print(resultFormated)
        print(totalAmount)
        print(billTextField.text ?? 0)
        print(splitNumberLabel.text ?? 0)
        print(tip)
        
        performSegue(withIdentifier: "goToResultVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultVC" {
            let destinationVC = segue.destination as! ResultsVC
            destinationVC.numOfPpl = numberOfPeople
            destinationVC.totalPerPerson =  resultFormated
            destinationVC.tip = Int(tip * 100)
        }
    }
    
}

