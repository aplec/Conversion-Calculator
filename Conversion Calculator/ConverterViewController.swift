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
    
    var rightInputLabel = UILabel(frame: CGRect(x: 0,y: 0,width: 50,height: 0))
    var rightOutputLabel = UILabel(frame: CGRect(x: 0,y: 0,width: 50,height: 0))
    
    var inputNumber:Double = 0;
    var outputNumber:Double = 0;
    
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
        
        inputDisplay.text = ""
        outputDisplay.text = ""
    
        rightInputLabel.text = converterArray[initialIndex].inputUnit
        rightInputLabel.font = UIFont.systemFont(ofSize: 40.0)

        rightOutputLabel.text = converterArray[initialIndex].outputUnit
        rightOutputLabel.font = UIFont.systemFont(ofSize: 40.0)

        inputDisplay.rightView = rightInputLabel
        inputDisplay.rightViewMode = .always

        outputDisplay.rightView = rightOutputLabel
        outputDisplay.rightViewMode = .always
    }
    
        
    @IBAction func converterButton(_ sender: AnyObject) {
       
        let alert = UIAlertController(title:"" , message: "Choose Converter", preferredStyle:UIAlertController.Style.actionSheet)
        
        alert.addAction(UIAlertAction(title: converterArray[0].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
                // handle choice A
               // self.inputDisplay.text = self.converterArray[0].inputUnit
                //self.outputDisplay.text = self.converterArray[0].outputUnit
                self.rightInputLabel.text = self.converterArray[0].inputUnit
                self.rightInputLabel.sizeToFit()
                self.rightOutputLabel.text = self.converterArray[0].outputUnit
                self.rightOutputLabel.sizeToFit()
                if(self.inputDisplay.text != ""){
                    self.outputDisplay.text = String((self.inputNumber-32)*5/9)
                }
            }))
            alert.addAction(UIAlertAction(title: converterArray[1].label, style: UIAlertAction.Style.default, handler: {
                (alertAction) -> Void in
                // handle choice B
                //self.inputDisplay.text = self.converterArray[1].inputUnit
                //self.outputDisplay.text = self.converterArray[1].outputUnit
                self.rightInputLabel.text = self.converterArray[1].inputUnit
                self.rightInputLabel.sizeToFit()
                self.rightOutputLabel.text = self.converterArray[1].outputUnit
                self.rightOutputLabel.sizeToFit()
                if(self.inputDisplay.text != ""){
                    self.outputDisplay.text = String(self.inputNumber*9/5+32)
                }
            }))
        
            alert.addAction(UIAlertAction(title: converterArray[2].label, style: UIAlertAction.Style.default, handler: {
                (alertAction) -> Void in
                // handle choice C
                //self.inputDisplay.text = self.converterArray[2].inputUnit
                //self.outputDisplay.text = self.converterArray[2].outputUnit
                self.rightInputLabel.text = self.converterArray[2].inputUnit
                self.rightInputLabel.sizeToFit()
                self.rightOutputLabel.text = self.converterArray[2].outputUnit
                self.rightOutputLabel.sizeToFit()
                if(self.inputDisplay.text != ""){
                    self.outputDisplay.text = String(self.inputNumber*1.60934)
                }
            }))
        
            alert.addAction(UIAlertAction(title: converterArray[3].label, style: UIAlertAction.Style.default, handler: {
                (alertAction) -> Void in
                // handle choice D
                //self.inputDisplay.text = self.converterArray[3].inputUnit
                //self.outputDisplay.text = self.converterArray[3].outputUnit
                self.rightInputLabel.text = self.converterArray[3].inputUnit
                self.rightInputLabel.sizeToFit()
                self.rightOutputLabel.text = self.converterArray[3].outputUnit
                self.rightOutputLabel.sizeToFit()
                if(self.inputDisplay.text != ""){
                    self.outputDisplay.text = String(self.inputNumber*0.621371)
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
    
        @IBAction func numbers(_ sender: AnyObject) {
            inputDisplay.text = inputDisplay.text! + String(sender.tag)
            inputNumber = Double(inputDisplay.text!)!
            
            if( self.rightInputLabel.text == self.converterArray[0].inputUnit){
                outputDisplay.text = String((inputNumber-32)*5/9)
            } else if( self.rightInputLabel.text == self.converterArray[1].inputUnit ){
                outputDisplay.text = String(inputNumber*9/5+32)
            } else if( self.rightInputLabel.text == self.converterArray[2].inputUnit ){
                outputDisplay.text = String(inputNumber*1.60934)
            } else if( self.rightInputLabel.text == self.converterArray[3].inputUnit ){
                outputDisplay.text = String(inputNumber*0.621371)
            }
        
        }
  
        @IBAction func clear(_ sender: Any) {
            inputDisplay.text = ""
            outputDisplay.text = ""
        }
    
        
        @IBAction func negative(_ sender: Any) {
            
            if(inputDisplay.text != ""){
                inputNumber = -inputNumber
                inputDisplay.text = String(inputNumber)
            }
            
            if( self.rightInputLabel.text == self.converterArray[0].inputUnit){
                outputDisplay.text = String((inputNumber-32)*5/9)
            } else if( self.rightInputLabel.text == self.converterArray[1].inputUnit ){
                outputDisplay.text = String(inputNumber*9/5+32)
            } else if( self.rightInputLabel.text == self.converterArray[2].inputUnit ){
                outputDisplay.text = String(inputNumber*1.60934)
            } else if( self.rightInputLabel.text == self.converterArray[3].inputUnit ){
                outputDisplay.text = String(inputNumber*0.621371)
            }
            
        }
    
        @IBAction func decimal(_ sender: Any) {
            
            if(inputDisplay.text != ""){
                inputDisplay.text = inputDisplay.text! + "."
            }
            
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



