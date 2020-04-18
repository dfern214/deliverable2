//
//  CoreData.swift
//  deliverable2
//
//  Created by Dylan Fernandez on 4/16/20.
//  Copyright © 2020 Dylan Fernandez. All rights reserved.
//
/*
import UIKit
import CoreData

class CoreData: NSObject, NSFetchedResultsControllerDelegate  {
    
    static let shared = CoreData()
    
    var idCounter: Int16 = 0
    var _fetchedResultsController: NSFetchedResultsController<Deliverable>? = nil
    
    
    override init() {
        super.init()
        idCounter = getId()
    }
    
    // MARK: - Fetched results controller
    
    var fetchedResultsController: NSFetchedResultsController<Deliverable> {
        
        
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Deliverable> = Deliverable.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: false)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: "Deliverable")
        aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }
    
    
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
    }
    
    // Core Data
    
    func insertNewObject(first: String, last: String, birthday: Date) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        let newDeliverable = Deliverable(context: context)
        
        // If appropriate, configure the new managed object.
        newDeliverable.id = idCounter.advanced(by: 1)
        newDeliverable.firstName = first
        newDeliverable.lastName = last
        newDeliverable.birthdate = birthday
        
        
        // Save the context.
        do {
            try context.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
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
}
 */
