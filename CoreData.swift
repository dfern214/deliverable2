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
    
    var managedObjectContext: NSManagedObjectContext? = nil
    var _fetchedResultsController: NSFetchedResultsController<Deliverable>? = nil
    
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
        let sortDescriptor = NSSortDescriptor(key: "first", ascending: false)
        
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
    
    func retrieveObject(first: String, last: String) {
        
    }
}
 */
