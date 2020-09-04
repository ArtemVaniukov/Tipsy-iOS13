//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipButtons: [UIButton]!
    var tipsyBrain = TipsyBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipButtonsConfigure()
    }
    
    func tipButtonsConfigure() {
        tipButtons = [zeroPctButton, tenPctButton, twentyPctButton]
    }
    
    func flashTextField() {
        let originalColor = billTextField.backgroundColor
        billTextField.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        UIView.animate(withDuration: 0.4) { [weak self] in
            self?.billTextField.backgroundColor = originalColor
        }
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        sender.isSelected = true
        tipButtons
            .filter { $0 != sender }
            .forEach { $0.isSelected = false }
        
        tipsyBrain.setTips(sender.currentTitle)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        tipsyBrain.setSplit(sender.value)
        splitNumberLabel.text = tipsyBrain.getSplit()
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard !billTextField.text!.isEmpty, let priceFromString = Float(billTextField.text!) else {
            flashTextField()
            return
        }
        
        tipsyBrain.setPrice(priceFromString)
        billTextField.endEditing(true)
        
        performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let resultsVC = segue.destination as! ResultsViewController
            resultsVC.total = tipsyBrain.getTotal()
            resultsVC.split = tipsyBrain.getSplit()
            resultsVC.tips = tipsyBrain.getTips()
        }
    }
    
    
}

