//
//  ViewController.swift
//  resistorCalc
//
//  Created by Edwin T on 5/3/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
  
var pickerData = [
    ["⬛️ 0", "🟫 1", "🟥 2", "🟧 3", "🟨 4", "🟩 5", "🟦 6", "🟪 7", "⬜️ 8", "    9", "Sliver", "Gold"],
    ["⬛️ 0", "🟫 1", "🟥 2", "🟧 3", "🟨 4", "🟩 5", "🟦 6", "🟪 7", "⬜️ 8", "    9", "Sliver", "Gold"],
    ["⬛️ 0", "🟫 1", "🟥 2", "🟧 3", "🟨 4", "🟩 5", "🟦 6", "🟪 7", "⬜️ 8", "    9", "Sliver", "Gold"],
    ["⬛️ 0", "🟫 1", "🟥 2", "🟧 3", "🟨 4", "🟩 5", "🟦 6", "🟪 7", "⬜️ 8", "    9", "Sliver", "Gold"],
   ]
    var pickedValue = [0, 0, 0, 0]
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var textArea: UILabel!
    @IBOutlet weak var textTwo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return 12
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("component \(component)")
        print("row \(row)")
        switch component {
        case 0:
            pickedValue[0] = row
        case 1:
            pickedValue[1] = row
        case 2:
            pickedValue[2] = row
        case 3:
            pickedValue[3] = row
        default:
            break
        }
        print("pickedValue \(pickedValue)")
        calcValue()
    }
    func calcValue() {
        //calc value of resistor
        var mult = 1
        let n1 = pickedValue[0] * 10
        let n2 = pickedValue[1] + n1

        if pickedValue[2] > 0 {
            for _ in 1...pickedValue[2] {
                mult *= 10
            }
            //print(total)
        }
        let total = n2 * mult

        //check valid resisitor
        if pickedValue[0] > 9 || pickedValue[1]  > 9 {
            textArea.text = "Invalid color code"
        } else {
            // update stuff
            textArea.text = "\(total) Ohm Resistor"
            if total > 1000, total < 1000000 {
                let adjTotal = total / 1000
                textTwo.text = "\(adjTotal)KΩ Resistor"
                tol(val: pickedValue[3])
            } else if  total > 1000000, total < 1000000000 {
                let adjTotal = total / 1000000
                textTwo.text = "\(adjTotal)MΩ Resistor"
                tol(val: pickedValue[3])

            }
            else if  total > 1000000000 {
                let adjTotal = total / 1000000000
                textTwo.text = "\(adjTotal)GΩ Resistor"
                tol(val: pickedValue[3])

        }
        }
    }
    func tol(val: Int) {
        switch val {
        case 0: textTwo.text! += " ± 20% Tolerance"
        case 1: textTwo.text! += " ± 1% Tolerance"
        case 2: textTwo.text! += " ± 2% Tolerance"
        case 3: textTwo.text! += " ± 3% Tolerance"
        case 4: textTwo.text! += " ± -0 + 100% Tolerance"
        case 5: textTwo.text! += " ± 0.5% Tolerance"
        case 6: textTwo.text! += " ± 0.25% Tolerance"
        case 7: textTwo.text! += " ± 0.10% Tolerance"
        case 8: textTwo.text! += " ± 0.05% Tolerance"
        case 9: textTwo.text! += " ± 10^ Tolerance"
        case 10: textTwo.text! += " ± 10% Tolerance"
        case 11: textTwo.text! += " ± 5% Tolerance"
        default:
            break
        }
    }
}

