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
    
    @IBAction func submitPress(sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gender.delegate = self
        self.gender.dataSource = self
        data = ["Male","Female"]
        
        
        // testing
        
        var name: Int16 = 0
        coreData.removeAll()
        coreData.insertNewObject(first: "Ricky", last: "Martin", birthday: Date(), gender: "Male")
        name = coreData.getId()
        test?.text = name.description
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
