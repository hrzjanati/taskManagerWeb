//
//  DashboardViewModel.swift
//  taskmanager
//
//  Created by Hossein Janati  on 8/8/23.
//

import Foundation
extension DashboardView {
    class ViewModel : ObservableObject {
        
        @Published var storedLanguage = CoreDataManager.shared.fetchTaskFormCoreData()
        
    }
}
