//
//  CoreDataManager.swift
//  taskmanager
//
//  Created by Hossein Janati  on 8/8/23.
//

import Foundation
import CoreData
import SwiftUI

struct CoreDataManager {
    static let shared = CoreDataManager()
    
    private var viewContext = PersistenceController.shared.container.viewContext
    
    private init() {
    }
    
    func addTaskInCoreData(_ items: [TaskDetails]) {
       // deleteLan()
        let _:[ItemsTask] = items.compactMap { (task) -> ItemsTask in
            let taskDB = ItemsTask(context: self.viewContext)
            taskDB.id      =  "\(task.id)"
            taskDB.title    = task.title
            taskDB.describtion = task.describtion
            taskDB.isCompleted = task.isComplited
            return taskDB
        }
        saveContext()
    }
    
    
    func fetchTaskFormCoreData()->[ItemsTask] {
        var result = [ItemsTask]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ItemsTask")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \ItemsTask.id, ascending: true)]
        do {
            if let all = try viewContext.fetch(request) as? [ItemsTask] {
                result = all
            }
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }
    
    func deleteTask() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ItemsTask")
        do {
            if let all = try viewContext.fetch(request) as? [ItemsTask] {
                for item in all {
                    viewContext.delete(item)
                }
            }
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        saveContext()
    }
    
    
    
    // MARK: - SAVE
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
