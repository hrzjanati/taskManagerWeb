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
    let describtion : String
    let isComplited  : Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case describtion
        case isComplited
    }
    
}
