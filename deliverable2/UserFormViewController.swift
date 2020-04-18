//
//  UserFormViewController.swift
//  deliverable2
//
//  Created by Christopher Bello on 4/17/20.
//  Copyright © 2020 Dylan Fernandez. All rights reserved.
//

import UIKit
import CoreData

class UserFormViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var coreData = CoreData.shared
    
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var bdayPicker: UIDatePicker!
    @IBOutlet weak var gengerPicker: UIPickerView!
    
    @IBOutlet weak var btnSave: UIButton!
    var arrayGender: [String] = ["Male", "Female"]
    
    @IBOutlet weak var btnCancel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.gengerPicker.delegate = self
        self.gengerPicker.dataSource = self
        
        
        coreData.insertNewObject(first: "Johnny", last: "Smith", birthday: Date())
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    
    
    /////////GENDER PICKER CONTROLS//////////////
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return arrayGender.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayGender[row]
    }
    

    
}
