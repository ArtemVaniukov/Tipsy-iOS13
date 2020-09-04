//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Artem Vaniukov on 04.09.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct TipsyBrain {
    
    private var price: Float = 0.0
    private var tips: Float = 0.1
    private var split = 2
    
    mutating func setPrice(_ price: Float) {
        self.price = price
    }
    
    mutating func setTips(_ tipsString: String?) {
        guard var tipsString = tipsString else { return }
        tipsString = tipsString.replacingOccurrences(of: "%", with: "")
        let tips = Float(tipsString)! / 100
        self.tips = tips
    }
    
    func getTips() -> String {
        let tips = Int(self.tips * 100)
        return "\(tips)"
    }
    
    mutating func setSplit(_ split: Double) {
        self.split = Int(split)
    }
    
    func getSplit() -> String {
        return "\(split)"
    }
    
    func getTotal() -> String {
        let total = (price + (price * tips)) / Float(split)
        return String(format: "%.2f", total)
    }
}
