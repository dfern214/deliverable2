//
//  CoreData.swift
//  deliverable2
//
//  Created by Dylan Fernandez on 4/16/20.
//  Copyright © 2020 Dylan Fernandez. All rights reserved.
//

import UIKit
import CoreData

class CoreData: NSObject, NSFetchedResultsControllerDelegate {
    
    static let shared = CoreData()
    
    var idCounter: Int16 = 0
    var _fetchedResultsController: NSFetchedResultsController<Deliverable>? = nil
    
    
    override init() {
        super.init()
        idCounter = getId()
    }
    
    var fetchedResultsController: NSFetchedResultsController<Deliverable> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Deliverable> = Deliverable.fetchRequest()
        
        fetchRequest.fetchBatchSize = 20
        
        let sortDescriptor = NSSortDescriptor(key: "firstName", ascending: false)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: "Deliverable")
        aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
    }
    
    // Core Data
    
    func insertNewObject(first: String, last: String, birthday: Date, gender: String) {
        
        var test: Bool = true
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Deliverable>(entityName: "Deliverable")
        
        // check to see if customer exists, and if they do add them to checkin pool
        /*
        do {
            let results = try context.fetch(fetchRequest)
            for i in results {
                if i.firstName == first && i.lastName == last && i.birthdate == birthday && i.gender == gender {
                    i.isIn = true
                    test = false
                }
            }
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
        }
        */
        // if not add them
        
        if test {
            let newDeliverable = Deliverable(context: context)
            
            // If appropriate, configure the new managed object.
            //newDeliverable.isIn = true
            newDeliverable.id = idCounter.advanced(by: 1)
            newDeliverable.firstName = first
            newDeliverable.lastName = last
            newDeliverable.birthdate = birthday
            newDeliverable.gender = gender
        }
        
        // Save the context.
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }

    func retrieveObject(customerId: Int) -> Deliverable {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        var customer = Deliverable(context: context)
        
        let fetchRequest = NSFetchRequest<Deliverable>(entityName: "Deliverable")
        
        do {
            let results = try context.fetch(fetchRequest)
            for i in results {
                if i.id == customerId {
                    customer = i
                }
            }
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
        }
        
        return customer
    }
    
    func getId() -> Int16 {
        var largestId: Int16 = 0
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Deliverable>(entityName: "Deliverable")
        
        do {
            let results = try context.fetch(fetchRequest)
            print(results.count.description)
            for i in results {
                if (i.id > largestId) {
                    largestId = i.id
                }
            }
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
        }
        
        return largestId
    }
    
    func getAll() -> [Any] {
        var objects: [Deliverable] = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Deliverable>(entityName: "Deliverable")
        
        do {
            let results = try context.fetch(fetchRequest)
            objects = results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
        }
        
        return objects
    }
    
    func removeAll() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Deliverable")
        
        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(batchDeleteRequest)
            try context.save()
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
        }
    }
}
