//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Artem Vaniukov on 04.09.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total: String!
    var split: String!
    var tips: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        totalLabel.text = total
        settingsLabel.text = "Split between \(split ?? "Error") people, with " + tips + "% tip."
    }
    
    @IBAction func recalculateTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
