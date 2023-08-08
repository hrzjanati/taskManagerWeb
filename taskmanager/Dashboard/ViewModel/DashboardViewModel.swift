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
        @Published var storedTask = CoreDataManager.shared.fetchTaskFormCoreData()
        //PRIVATE
        private var arrayOfTask : TaskDetails
        //MARK: - INIT
        init() {
            arrayOfTask = provider.adarrayOfTaskDefualt
        }
        
        func addtocoredata() {
            CoreDataManager.shared.addTaskInCoreData([arrayOfTask])
            storedTask = CoreDataManager.shared.fetchTaskFormCoreData()
        }
    }
}
