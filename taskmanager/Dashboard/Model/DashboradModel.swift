//
//  DashboradModel.swift
//  taskmanager
//
//  Created by Hossein Janati  on 8/8/23.
//

import Foundation

struct TaskDetails : Codable ,Identifiable {
    let id = UUID()
    let title : String
    let description : String
    let isCompleted  : Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case isCompleted
    }
}
