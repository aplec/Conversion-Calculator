//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Ante Plecas on 10/31/19.
//  Copyright © 2019 Ante Plecas. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    @IBOutlet weak var outputDisplay: UITextField!
       
    @IBOutlet weak var inputDisplay: UITextField!
    
    struct Converter{
          var label: String
          var inputUnit: String
          var outputUnit: String
      }
    
   let converterArray: [Converter] = [Converter(label: "farenheit to celcius",inputUnit: "°F",outputUnit: "°C"),
                                      Converter(label: "celcius to farenheit",inputUnit: "°C",outputUnit: "°F"),
                                      Converter(label: "miles to kilometers",inputUnit: "mi",outputUnit: "km"),
                                      Converter(label: "kilometers to miles",inputUnit: "km",outputUnit: "mi")]
    
   override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialIndex: Int = 0

        inputDisplay.text = converterArray[initialIndex].inputUnit
        outputDisplay.text = converterArray[initialIndex].outputUnit
    }
    
        
    @IBAction func converterButton(_ sender: AnyObject) {
       
        let alert = UIAlertController(title:"" , message: "Choose Converter", preferredStyle:UIAlertController.Style.actionSheet)
        
        alert.addAction(UIAlertAction(title: converterArray[0].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
                // handle choice A
                self.inputDisplay.text = self.converterArray[0].inputUnit
                self.outputDisplay.text = self.converterArray[0].outputUnit
            }))
            alert.addAction(UIAlertAction(title: converterArray[1].label, style: UIAlertAction.Style.default, handler: {
                (alertAction) -> Void in
                // handle choice B
                self.inputDisplay.text = self.converterArray[1].inputUnit
                self.outputDisplay.text = self.converterArray[1].outputUnit
            }))
        
            alert.addAction(UIAlertAction(title: converterArray[2].label, style: UIAlertAction.Style.default, handler: {
                (alertAction) -> Void in
                // handle choice C
                self.inputDisplay.text = self.converterArray[2].inputUnit
                self.outputDisplay.text = self.converterArray[2].outputUnit
            }))
        
            alert.addAction(UIAlertAction(title: converterArray[3].label, style: UIAlertAction.Style.default, handler: {
                (alertAction) -> Void in
                // handle choice D
                self.inputDisplay.text = self.converterArray[3].inputUnit
                self.outputDisplay.text = self.converterArray[3].outputUnit
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


