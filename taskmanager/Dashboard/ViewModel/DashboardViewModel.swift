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
        @Published var showingAlert : Bool
        @Published var state : Bool = false
        @Published var currentStatus = "ToDO"
        @Published var statusOfTask = ["ToDO", "Done"]
        //PRIVATE
        private var arrayOfTask : TaskDetails
        private var caneclBage = CancelBag()
        //MARK: - INIT
        init() {
            arrayOfTask = provider.addarrayOfTaskDefualt
            title = provider.title
            description = provider.description
            showingAlert = provider.showingAlert
            self.subscribtionCurrentState()
        }
        
        func addtocoredata() {
            CoreDataManager.shared.addTaskInCoreData([TaskDetails(title: title,
                                                                  description: description,
                                                                  isCompleted: false)])
            storedTask = CoreDataManager.shared.fetchTaskFormCoreData()
            title = ""
            description = ""
        }
        
        func removeRows(at offsets: IndexSet) {
            if storedTask.indices.contains(offsets) {
                guard let index = offsets.first else { return }
                let item = storedTask[index].id
                CoreDataManager.shared.deleteTask(id: item ?? "")
            }
        }
        
        func subscribtionCurrentState() {
            $currentStatus
                .sink { [self] str in
                    print(str)
                    if str == "ToDO" {
                        state = false
                    } else {
                        state = true
                    }
                }
                .store(in: caneclBage)
        }
    }
}
