//
//  ResultsVC.swift
//  Tipsy
//
//  Created by Varun Kumar on 12/04/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {
    
    var totalPerPerson = "No Bill"
    var numOfPpl = 0
    var tip = 0

    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text  = String(totalPerPerson)
        settingsLabel.text = "Split between \(numOfPpl) people, with \(tip)% tip."

    }
     
    @IBAction func reCalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
