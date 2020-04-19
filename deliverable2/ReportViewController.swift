//
//  ReportViewController.swift
//  deliverable2
//
//  Created by Christopher Bello on 4/17/20.
//  Copyright © 2020 Dylan Fernandez. All rights reserved.
//

import UIKit
import CoreData

class ReportViewController: UIViewController {
    
    var coreData = CoreData.shared
    
    @IBOutlet weak var lblDaily: UILabel!
    @IBOutlet weak var lblMale: UILabel!
    @IBOutlet weak var lblFemale: UILabel!
    @IBOutlet weak var lblWeekly: UILabel!
    @IBOutlet weak var lblAvgAge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //test()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        calculations()
        
    }
    
 
    
    func calculations()
    {
        var dailyTotal = 0
        var weeklyTotal = 0
        var maleTotal = 0
        var femaleTotal = 0
        var ageTemp = 0
        
        var deliCount = 0
        while deliCount < coreData.getAll().count
        {
            let deliPath = IndexPath(row: deliCount, section: 0)
            let deliverable = coreData.fetchedResultsController.object(at: deliPath)
            
            
           // if let signin = deliverable.timeIn! {
                
            
            
            if deliverable.timeIn ?? Date()  > Date().addingTimeInterval(-86400)
           {
            dailyTotal = dailyTotal + 1
            }
            if deliverable.timeIn ?? Date() > Date().addingTimeInterval(-604800)
            {
                weeklyTotal = weeklyTotal + 1
            }
            if deliverable.gender == "Male"
            {
                maleTotal = maleTotal + 1
            }
            if deliverable.gender == "Female"
            {
                femaleTotal = femaleTotal + 1
            }
            
            let age = Calendar.current.dateComponents([.year, .month, .day], from: deliverable.birthdate!, to: Date()).year
            
            ageTemp = ageTemp + age!
            //lblAvgAge.text = "\(deliverable.birthdate!)"
           // }
            deliCount = deliCount + 1
        }
        
        var ageAvg = 0
        if deliCount > 0
        {
            ageAvg = ageTemp / deliCount
        }
        
        lblDaily.text = "\(dailyTotal)"
        lblMale.text = "\(maleTotal)"
        lblFemale.text = "\(femaleTotal)"
        lblWeekly.text = "\(weeklyTotal)"
        lblAvgAge.text = "\(ageAvg)"
       // let deliverable = coreData.fetchedResultsController.object(at: <#T##IndexPath#>)
        
    }
    
    
    
}
