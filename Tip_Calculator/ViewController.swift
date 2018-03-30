//
//  ViewController.swift
//  Tip_Calculator
//
//  Created by Mac Lab on 1/19/17.
//  Copyright © 2017 Corey Lee. All rights reserved.
//

import UIKit

let PEOPLE_KEY = "People_Key"
let TIP_KEY = "Tip_Key"

class ViewController: UIViewController {
    
    var tipPercent:Int = 15
    var amount:Double = 0.0
    var totalTip:Double = 0.0
    var totalWithTip:Double = 0.0
    var tipEach:Double = 0.0
    var totalEach:Double = 0.0
    var people:Int = 1
    
    let fmt = NumberFormatter()
    var tipDefault = 15
    var peopleDefault = 1
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    
    @IBAction func calculateBtnPressed(_ sender: UIButton) {
        // print("Calculate")
        amountTextField.resignFirstResponder()
        calculateTip()
        updateUI()
    }
    
    @IBOutlet weak var peopleSegCon: UISegmentedControl!
    @IBOutlet weak var totalTipField: UITextField!
    @IBOutlet weak var totalWithTipField: UITextField!
    @IBOutlet weak var tipEachField: UITextField!
    @IBOutlet weak var totalEachField: UITextField!
    
    
    @IBAction func tipSliderChanged(_ sender: UISlider) {
        tipPercent = Int(tipSlider.value)
        tipLabel.text = String(tipPercent) + "%"
        calculateTip()
        updateUI()
    }
    
    @IBAction func peopleSegConChanged(_ sender: UISegmentedControl) {
        people = sender.selectedSegmentIndex + 1
        calculateTip()
        updateUI()
    }
    
    
    func calculateTip() {
        let amtString = amountTextField.text!
        
        if let temp = Double(amtString) {
            amount = temp
        } else {
            amount = 0.0
        }
        totalTip = (amount * ((Double(tipPercent))/100))
        totalWithTip = amount + totalTip
        tipEach = (amount * ((Double(tipPercent))/100)/Double(people))
        totalEach = tipEach + (amount/Double(people))
    }
    
    func updateUI() {
        totalTipField.text = fmt.string(for: totalTip)
        totalWithTipField.text = fmt.string(for: totalWithTip)
        tipEachField.text = fmt.string(for: tipEach)
        totalEachField.text = fmt.string(for: totalEach)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getDefaults()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fmt.numberStyle = .currency
        fmt.locale = Locale(identifier: "en-US")
        tipPercent = Int(tipSlider.value)
        tipLabel.text = String(tipPercent) + "%"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func getDefaults() {
        if let peopleChoice = defaults.string(forKey: PEOPLE_KEY),
           let tipChoice = defaults.string(forKey: TIP_KEY) {
            // print(peopleChoice)
            if let p = Int(peopleChoice) {
                // print(p)
                peopleSegCon.selectedSegmentIndex = p-1
            }
            // print(tipChoice)
            if let t = Float(tipChoice) {
                // print(t)
                tipSlider.value = t
                tipPercent = Int(t)
                tipLabel.text = tipChoice + "%"
            }
            
        } else {
            peopleSegCon.selectedSegmentIndex = peopleDefault-1
            tipSlider.value = Float(tipDefault)
            defaults.set(peopleDefault, forKey: PEOPLE_KEY)
            defaults.set(tipDefault, forKey: TIP_KEY)
        }
        
    }


}

