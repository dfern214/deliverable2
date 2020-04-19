//
//  WaitingViewController.swift
//  deliverable2
//
//  Created by Christopher Bello on 4/17/20.
//  Copyright © 2020 Dylan Fernandez. All rights reserved.
//
import CoreData
import UIKit

class ClientCell: UITableViewCell {
    
   let coreData = CoreData.shared
    
   let tableView = WaitingListViewController.shared
    
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var checkInButton: UIButton!
    
    @IBAction func buttonPress(sender: UIButton) {
        let cell = sender.superview?.superview as! UITableViewCell
        let indexPath = tableView.tableView.indexPath(for: cell)
        
        //let object = coreData.retrieveObject(customerId: indexPath!.row)
        
        //object.isIn = false
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        do {
            try context.save()
           // print(object.isIn.description)
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        tableView.tableView.reloadData()
    }
}

class HeaderCell: UITableViewCell {
    @IBOutlet weak var nameTitle: UIButton!
    @IBOutlet weak var timeTitle: UIButton!
    @IBOutlet weak var placeTitle: UIButton!
}

class WaitingListViewController: UITableViewController {
    
    var coreData = CoreData.shared
    
    static let shared = WaitingListViewController()
    
    var managedObjectContext: NSManagedObjectContext? = nil
    
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return coreData.fetchedResultsController.sections?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = coreData.fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClientCell", for: indexPath) as! ClientCell
        let deliverable = coreData.fetchedResultsController.object(at: indexPath)
        
        configureCell(cell, deliverable: deliverable, indexPath: indexPath, numberOfObjects: coreData.getAll().count)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
        
        headerCell.nameTitle.setTitle("Name", for: .normal)
        headerCell.placeTitle.setTitle("Place", for: .normal)
        headerCell.timeTitle.setTitle("Time Remaining", for: .normal)
        
        return headerCell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let context = coreData.fetchedResultsController.managedObjectContext
            context.delete(coreData.fetchedResultsController.object(at: indexPath))
            
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
            
            coreData.fetchedResultsController.object(at: indexPath).timeRemaining = String(coreData.getAll().count * 5)
            
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
        tableView.reloadData()
        
    }
    
    func configureCell(_ cell: ClientCell, deliverable: Deliverable, indexPath: IndexPath, numberOfObjects: Int) {
        //let sectionInfo = coreData.fetchedResultsController.sections![section]
        
        cell.name?.text = deliverable.firstName! +  " " + String(deliverable.lastName!.first!) + "."
        cell.place?.text = String(indexPath.row + 1)
        cell.time?.text = deliverable.timeRemaining
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
            configureCell(tableView.cellForRow(at: indexPath!) as! ClientCell, deliverable: anObject as! Deliverable)
        case .move:
            configureCell(tableView.cellForRow(at: indexPath!) as! ClientCell, deliverable: anObject as! Deliverable)
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
 */
}
