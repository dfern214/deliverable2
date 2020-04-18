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
    
    var data: [String] = [String]()
    
    @IBOutlet var firstBox: UITextField!
    @IBOutlet var lastBox: UITextField!
    @IBOutlet var gender: UIPickerView!
    @IBOutlet var dateOfBirth: UIDatePicker!
    @IBOutlet var submitButton: UIButton!
    
    @IBAction func submitPress(_sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gender.delegate = self
        self.gender.dataSource = self
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
