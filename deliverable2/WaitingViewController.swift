//
//  WaitingViewController.swift
//  deliverable2
//
//  Created by Christopher Bello on 4/17/20.
//  Copyright © 2020 Dylan Fernandez. All rights reserved.
//

import UIKit

class ClientCell: UITableViewCell {
    
   // let coreData = CoreData.shared
    
   // let tableView = WaitingListViewController.shared
    
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var checkInButton: UIButton!
    
    /*
    @IBAction func buttonPress(sender: UIButton) {
        let cell = sender.superview?.superview as! UITableViewCell
        let indexPath = tableView.tableView.indexPath(for: cell)
        
        let object = coreData.retrieveObject(customerId: indexPath!.row)
        
        object.isIn = false
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        do {
            try context.save()
            print(object.isIn.description)
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        tableView.tableView.reloadData()
    }
    */
}

class HeaderCell: UITableViewCell {
    @IBOutlet weak var nameTitle: UIButton!
    @IBOutlet weak var timeTitle: UIButton!
    @IBOutlet weak var placeTitle: UIButton!
}

class WaitingListViewController: UITableViewController {
    
    var coreData = CoreData.shared
    
    static let shared = WaitingListViewController()
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
        //if deliverable.isIn {
        cell.name!.text = deliverable.firstName! +  " " + String(deliverable.lastName!.first!) + "."
        cell.place?.text = String(indexPath.row + 1)
        cell.time?.text = "test"
        /*} else {
            let newCell = tableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath)
            return newCell
        }*/
    }
    /*
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        default:
            return
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            configureCell(tableView.cellForRow(at: indexPath!)!, withEvent: anObject as! Event)
        case .move:
            configureCell(tableView.cellForRow(at: indexPath!)!, withEvent: anObject as! Event)
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        }
    }
     
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(ClientCell.self as AnyClass, forCellReuseIdentifier: "cell")
        self.tableView.register(HeaderCell.self as AnyClass, forCellReuseIdentifier: "cell")
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
