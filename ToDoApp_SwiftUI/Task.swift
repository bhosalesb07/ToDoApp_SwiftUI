//
//  ToDoModel.swift
//  ToDoApp_SwiftUI
//
//  Created by Mac on 19/10/25.
//

import Foundation
import SwiftUI

struct Task:Identifiable{
    let id = UUID()
    let title:String
    var isComplete:Bool
    let priority: Priority
}


enum Priority:String,Identifiable,CaseIterable{
    case urgent,normal,optional
    
    var id:Self {self}
    
    var title:String{
        switch self {
        case .urgent:
            return "Urgent"
        case .normal:
            return "Normal"
        case .optional:
            return "Optional"
        }
    }
    var color:Color{
        switch self {
        case .urgent:
            return Color.red
        case .normal:
            return Color.blue
        case .optional:
            return Color.green
        }
    }
}
