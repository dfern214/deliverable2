//
//  WaitingViewController.swift
//  deliverable2
//
//  Created by Christopher Bello on 4/17/20.
//  Copyright © 2020 Dylan Fernandez. All rights reserved.
//

import UIKit

class ClientCell: UITableViewCell {
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var checkIn: UIButton!
}

class HeaderCell: UITableViewCell {
    @IBOutlet weak var nameTitle: UIButton!
    @IBOutlet weak var timeTitle: UIButton!
    @IBOutlet weak var placeTitle: UIButton!
}

class WaitingListViewController: UITableViewController {
    
    var coreData = CoreData.shared
    /*
     override func numberOfSections(in tableView: UITableView) -> Int {
     return coreData.fetchedResultsController.sections?.count ?? 0
     }
     */
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
        
        headerCell.nameTitle.setTitle("Name", for: .normal)
        headerCell.placeTitle.setTitle("Place", for: .normal)
        headerCell.timeTitle.setTitle("Time Remaining", for: .normal)
        
        return headerCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreData.getAll().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClientCell", for: indexPath) as! ClientCell
        let deliverable = coreData.fetchedResultsController.object(at: indexPath)
        configureCell(cell, withDeliverable: deliverable, indexPath: indexPath)
        return cell
    }
    
    func configureCell(_ cell: ClientCell, withDeliverable deliverable: Deliverable, indexPath: IndexPath) {
        //let item = deliverable.id.description + "\t" + " | " + "\t" + deliverable.firstName! + "\t" + " | " + "\t" + deliverable.lastName! + "\t"
        cell.name?.text = deliverable.firstName! +  " " + String(deliverable.lastName!.first!) + "."
        cell.place?.text = String(indexPath.row + 1)
        cell.time?.text = "test"
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
        
        tableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
