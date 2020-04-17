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

    var coreData = CoreData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        coreData.insertNewObject(first: "Dylan", last: "Fernandez", birthday: Date())
        
    }
    
    
}

