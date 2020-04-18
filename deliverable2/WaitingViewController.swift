//
//  WaitingViewController.swift
//  deliverable2
//
//  Created by Christopher Bello on 4/17/20.
//  Copyright © 2020 Dylan Fernandez. All rights reserved.
//

import UIKit

class WaitingListViewController: UITableViewController {
    
    var coreData = CoreData.shared
    /*
     override func numberOfSections(in tableView: UITableView) -> Int {
     return coreData.fetchedResultsController.sections?.count ?? 0
     }
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreData.getAll().count - 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let deliverable = coreData.fetchedResultsController.object(at: indexPath)
        configureCell(cell, withDeliverable: deliverable)
        return cell
    }
    
    func configureCell(_ cell: UITableViewCell, withDeliverable deliverable: Deliverable) {
        let item = deliverable.id.description + "\t" + " | " + "\t" + deliverable.firstName! + "\t" + " | " + "\t" + deliverable.lastName! + "\t"
        
        cell.textLabel?.text = item
    }
    /*
     func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
     tableView.beginUpdates()
     }
     
     func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
     tableView.endUpdates()
     }
     */
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
