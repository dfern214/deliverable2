//
//  CoreData.swift
//  deliverable2
//
//  Created by Dylan Fernandez on 4/16/20.
//  Copyright © 2020 Dylan Fernandez. All rights reserved.
//
/*
import Foundation
import CoreData

class CoreData {
    
    var managedObjectContext: NSManagedObjectContext? = nil
    var _fetchedResultsController: NSFetchedResultsController<Entity>? = nil
    
    // MARK: - Fetched results controller
    
    var fetchedResultsController: NSFetchedResultsController<Entity> {
        
        
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "first", ascending: false)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: "Model")
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
    
    func insertNewObject(first: String, last: String, id: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        let newEntity = Entity(context: context)
        
        // If appropriate, configure the new managed object.
        newEntity.clockStatus = false // Clocked out
        newEntity.first = first
        newEntity.last = last
        newEntity.id = id
        
        
        // Save the context.
        do {
            try context.save()
            addedEmployeeAlert()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
 
 */
