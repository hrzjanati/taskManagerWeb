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
        @Published var title : String
        @Published var description : String
        //PRIVATE
        private var arrayOfTask : TaskDetails
        //MARK: - INIT
        init() {
            arrayOfTask = provider.addarrayOfTaskDefualt
            title = provider.title
            description = provider.description
        }
        
        func addtocoredata() {
            CoreDataManager.shared.addTaskInCoreData([TaskDetails(title: title,
                                                                 description: description,
                                                                    isCompleted: false)])
            storedTask = CoreDataManager.shared.fetchTaskFormCoreData()
            title = ""
            description = ""
        }
    }
}
