//
//  UserFormViewController.swift
//  deliverable2
//
//  Created by Christopher Bello on 4/17/20.
//  Copyright © 2020 Dylan Fernandez. All rights reserved.
//

import UIKit
import CoreData

class UserFormViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //accessor to shared CoreData Model
    var coreData = CoreData.shared
    var data: [String] = [String]()
    
    @IBOutlet weak var firstBox: UITextField!
    @IBOutlet weak var lastBox: UITextField!
    @IBOutlet weak var gender: UIPickerView!
    @IBOutlet weak var dateOfBirth: UIDatePicker!
    @IBOutlet weak var submitButton: UIButton!
   
    @IBOutlet weak var cancelButton: UIButton!
    
    //cancel button event
    @IBAction func cancelButtonClick(_ sender: Any) {
        //alert for user when cancel button is pressed
        let alert = UIAlertController(title: "Warning", message: "You have canceled user entry", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")}))
        self.present(alert, animated: true, completion: nil)
        
        //clear all items
        firstBox.text = ""
        lastBox.text = ""
        gender.selectRow( 0, inComponent: 0, animated: true)
        dateOfBirth.setDate(dateOfBirth.maximumDate!, animated: true)
    }
    
    //submit button event
    @IBAction func submitButtonClick(_ sender: Any) {
        //do catch for any excecution errors
        do {
            //boolean for checking if the data is valid or not.
            var valid = true
            
            //temporary variables to call for label assignments
            var first = ""
            var last = ""
            
            //data validation regex string for only text and white spaces
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
            
            //checks if text from text field is only characters and not numbers
            if regex.firstMatch(in: firstBox.text!, options: [], range: NSMakeRange(0, (firstBox.text?.count)!)) != nil {
                
                //alert for user warning them that they cannot type numbers
                let alert = UIAlertController(title: "Warning", message: "Must not contain Number in Name", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")}))
                self.present(alert, animated: true, completion: nil)
                
                //sets validity to false
                valid = false
                
                //if there are no numbers, then it will check if field is empty
            } else if firstBox.text == ""
            {
                //warns user of empty field
                let alert = UIAlertController(title: "Warning", message: "Must not be empty in Name", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")}))
                self.present(alert, animated: true, completion: nil)
                //set validity to false
                valid = false
            }
                //if everything is correct then it will set temporary field to TextField Text
            else{
                first = firstBox.text!
            }
            
            //checks if text from text field is only characters and not numbers
            if regex.firstMatch(in: lastBox.text!, options: [], range: NSMakeRange(0, (lastBox.text?.count)!)) != nil {
                
                //alert for user warning them that they cannot type numbers
                let alert = UIAlertController(title: "Warning", message: "Must not contain Number in Name", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")}))
                self.present(alert, animated: true, completion: nil)
                
                //sets validity to false
                valid = false
                
                //if there are no numbers, then it will check if field is empty
            } else if lastBox.text == ""
            {
                //warns user of empty field
                let alert = UIAlertController(title: "Warning", message: "Must not be empty in Name", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")}))
                self.present(alert, animated: true, completion: nil)
                
                //sets validity to false
                valid = false
            }
                //if everything is correct then it will set temporary field to TextField Text
            else{
                last = lastBox.text!
            }
            
            //select gender from the gender picker
            let selectedGender = data[gender.selectedRow(inComponent: 0)]
            
            //if validity boolean is true then insert new object
            if valid{
                coreData.insertNewObject(first: first, last: last, birthday: dateOfBirth.date, gender: selectedGender)
                
                //notify user of succesful insertion
                let alert = UIAlertController(title: "Success", message: "New User Created Succesfully", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")}))
                self.present(alert, animated: true, completion: nil)
                
                //after insertion reset fields
                firstBox.text = ""
                lastBox.text = ""
                gender.selectRow( 0, inComponent: 0, animated: true)
                dateOfBirth.setDate(dateOfBirth.maximumDate!, animated: true)
            }
        }
        catch {
            
            print("Error")
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set picker delegate and dataSource
        self.gender.delegate = self
        self.gender.dataSource = self
        
        //gender data array for both fields
        data = ["Male","Female"]
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UIPICKERVIEW
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    // UIPICKERVIEW END
    
    
}
