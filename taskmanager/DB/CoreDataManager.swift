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
    //MARK: -  Init
    private init() {
    }
    //MARK: -  Add
    func addTaskInCoreData(_ items: [TaskDetails]) {
        let _:[ItemsTask] = items.compactMap { (task) -> ItemsTask in
            let taskDB = ItemsTask(context: self.viewContext)
            taskDB.id      =  "\(task.id)"
            taskDB.title    = task.title
            taskDB.describtion = task.description
            taskDB.isCompleted = task.isCompleted
            return taskDB
        }
        saveContext()
    }
    //MARK: - Fetch
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
    
    func updateTaskIsCompleted(id: String , isCompleted: Bool , compliction : @escaping () -> ()) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ItemsTask")
        do {
            if let items = try viewContext.fetch(request) as? [ItemsTask] {
                if let item = items.first(where: {$0.id == id}) {
                    item.isCompleted = isCompleted
                    compliction()
                }
            }
        }catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        saveContext()
        
    }
    //MARK: -  Delete
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
    
    func deleteTask(id : String) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ItemsTask")
        do {
            if let items = try viewContext.fetch(request) as? [ItemsTask] {
                if let item = items.first(where: {$0.id == id}) {
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
