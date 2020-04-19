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
    
    //shared data components for coredata
    var coreData = CoreData.shared
    
    @IBOutlet weak var lblDaily: UILabel!
    @IBOutlet weak var lblMale: UILabel!
    @IBOutlet weak var lblFemale: UILabel!
    @IBOutlet weak var lblWeekly: UILabel!
    @IBOutlet weak var lblAvgAge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //call report calculations method
        calculations()
        
    }
    
 
    // function for calculating all report data and output for view
    func calculations()
    {
        
        //total and average variables
        var dailyTotal = 0
        var weeklyTotal = 0
        var maleTotal = 0
        var femaleTotal = 0
        var ageTemp = 0
        
        //count variable for loop index
        var deliCount = 0
        
        //loop through all deliverable rows
        while deliCount < coreData.getAll().count
        {
            //create index path using loop variable
            let deliPath = IndexPath(row: deliCount, section: 0)
            
            //create deliverable object using its corresponding index
            let deliverable = coreData.fetchedResultsController.object(at: deliPath)
            
            //add to daily total if the time in is within 1 day
            if deliverable.timeIn ?? Date()  > Date().addingTimeInterval(-86400)
           {
            dailyTotal = dailyTotal + 1
            }
            
            //add to weekly total if the time in is within 7 days
            if deliverable.timeIn ?? Date() > Date().addingTimeInterval(-604800)
            {
                weeklyTotal = weeklyTotal + 1
            }
            
            //add male gender total is male
            if deliverable.gender == "Male"
            {
                maleTotal = maleTotal + 1
            }
            
            //add to female gender total if female
            if deliverable.gender == "Female"
            {
                femaleTotal = femaleTotal + 1
            }
            
            //calculate age using date of birth
            let age = Calendar.current.dateComponents([.year, .month, .day], from: deliverable.birthdate!, to: Date()).year
            
            //get average age
            ageTemp = ageTemp + age!
            
            //increment loop count
            deliCount = deliCount + 1
        }
        
        //set average age variable to 0
        var ageAvg = 0
        
        //if there are items in coreData then calculate average
        if deliCount > 0
        {
            ageAvg = ageTemp / deliCount
        }
       
        
        //set all labels to their corresponding values
        lblDaily.text = "\(dailyTotal)"
        lblMale.text = "\(maleTotal)"
        lblFemale.text = "\(femaleTotal)"
        lblWeekly.text = "\(weeklyTotal)"
        lblAvgAge.text = "\(ageAvg)"
    
        
    }
    
    
    
}
