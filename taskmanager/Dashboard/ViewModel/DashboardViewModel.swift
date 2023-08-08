//
//  DashboardViewModel.swift
//  taskmanager
//
//  Created by Hossein Janati  on 8/8/23.
//

import Foundation
extension DashboardView {
    class ViewModel : ObservableObject {
        public var provider: DashboardProviding = Resolver.shared.resolve(DashboardProviding.self)
        //PUBLISH
        @Published var storedLanguage = CoreDataManager.shared.fetchTaskFormCoreData()
        //PRIVATE
        private var add = ItemsTask()
        //MARK: - INIT
        init() {
         
        }
        
        func addtocoredata() {
            CoreDataManager.shared.addTaskInCoreData([add])
        }
    }
}
