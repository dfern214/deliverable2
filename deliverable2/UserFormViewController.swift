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
    
    var coreData = CoreData.shared
    var data: [String] = [String]()
    
    @IBOutlet weak var firstBox: UITextField!
    @IBOutlet weak var lastBox: UITextField!
    @IBOutlet weak var gender: UIPickerView!
    @IBOutlet weak var dateOfBirth: UIDatePicker!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var test: UILabel!
    @IBAction func submitButtonClick(_ sender: Any) {
        do {
            var valid = true
            var first = ""
            var last = ""
            
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
            if regex.firstMatch(in: firstBox.text!, options: [], range: NSMakeRange(0, (firstBox.text?.count)!)) != nil {
                let alert = UIAlertController(title: "Warning", message: "Must not contain Number in Name", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")}))
                self.present(alert, animated: true, completion: nil)
                valid = false
            } else if firstBox.text == ""
            {
                let alert = UIAlertController(title: "Warning", message: "Must not be empty in Name", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")}))
                self.present(alert, animated: true, completion: nil)
                valid = false
            }
            else{
                first = firstBox.text!
            }
            
            
            if regex.firstMatch(in: lastBox.text!, options: [], range: NSMakeRange(0, (lastBox.text?.count)!)) != nil {
                let alert = UIAlertController(title: "Warning", message: "Must not contain Number in Name", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")}))
                self.present(alert, animated: true, completion: nil)
                valid = false
            } else if lastBox.text == ""
            {
                let alert = UIAlertController(title: "Warning", message: "Must not be empty in Name", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")}))
                self.present(alert, animated: true, completion: nil)
                valid = false
            }
            else{
                last = lastBox.text!
            }
            
            let selectedGender = data[gender.selectedRow(inComponent: 0)]
            
            if valid{
                coreData.insertNewObject(first: first, last: last, birthday: dateOfBirth.date, gender: selectedGender)
            }
        }
        catch {
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gender.delegate = self
        self.gender.dataSource = self
        data = ["Male","Female"]
        
        
        // testing
        
        //var name: Int16 = 0
        //coreData.removeAll()
        //coreData.insertNewObject(first: "Ricky", last: "Martin", birthday: Date().addingTimeInterval(-93122222), gender: "Male")
        //name = coreData.getId()
        //test?.text = name.description
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
