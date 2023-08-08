//
//  DashboardProvide.swift
//  taskmanager
//
//  Created by Hossein Janati  on 8/8/23.
//

import Foundation
protocol DashboardProviding {
    var addarrayOfTaskDefualt : TaskDetails { get }
    var title : String { get }
    var description : String { get }
    var showingAlert : Bool { get }
    var state : Bool { get }
    }

class DashboardProvider: DashboardProviding {
    var state: Bool {
        return false
    }
    var showingAlert: Bool {
        return false
    }
    
    var title: String {
        return ""
    }
    
    var description: String {
        return ""
    }
    
    var addarrayOfTaskDefualt: TaskDetails {
        return TaskDetails(title: "test",
                            description: "describtion of swift",
                            isCompleted: true)
    }
}
