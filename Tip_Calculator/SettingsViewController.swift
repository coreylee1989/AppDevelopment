//
//  SettingsViewController.swift
//  Tip_Calculator
//
//  Created by Mac Lab on 1/26/17.
//  Copyright © 2017 Corey Lee. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var people = ["1", "2", "3", "4", "5"]
    var tipPercent = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"]
    
    let defaults = UserDefaults.standard
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        // print("Cancel")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        // print("Save")
        let peopleDefault = people[pickerView.selectedRow(inComponent: 0)]
        let tipPercentDefault = tipPercent[pickerView.selectedRow(inComponent: 1)]
        defaults.set(peopleDefault, forKey: PEOPLE_KEY)
        defaults.set(tipPercentDefault, forKey: TIP_KEY)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return people.count
        } else {
            return tipPercent.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return people[row]
        } else {
            return tipPercent[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            print(people[row])
        } else {
            print(tipPercent[row])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
