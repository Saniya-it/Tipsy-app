//
//  ResultsViewController.swift
//  lucky-tipsy
//
//  Created by Dauletkhanova Saniya.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var tip = 0
    var numberOfPeople = 0
    var total = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(tip)% tip."
        totalLabel.text = total
        
    }
    

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel! 
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
