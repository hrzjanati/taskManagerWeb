//
//  DashboardProvide.swift
//  taskmanager
//
//  Created by Hossein Janati  on 8/8/23.
//

import Foundation
protocol DashboardProviding {
    var adarrayOfTaskDefualt : TaskDetails { get }
}

class DashboardProvider: DashboardProviding {
    var adarrayOfTaskDefualt: TaskDetails {
        return TaskDetails(title: "test",
                            describtion: "test",
                            isComplited: true)
    }
}
