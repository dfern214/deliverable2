//
//  ViewController.swift
//  deliverable2
//
//  Created by Dylan Fernandez on 4/16/20.
//  Copyright © 2020 Dylan Fernandez. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var coreData = CoreData.shared
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var object: Deliverable? = nil
        var name = 0
        
        coreData.insertNewObject(first: "Ricky", last: "Martin", birthday: Date())
        object = coreData.retrieveObject(customerId: 1)
        name = coreData.getAll().count
        label.text = name.description
    }
}

