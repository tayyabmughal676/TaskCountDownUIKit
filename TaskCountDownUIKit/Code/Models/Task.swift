//
//  Task.swift
//  TaskCountDownUIKit
//
//  Created by Thor on 22/08/2021.
//

import Foundation


struct TaskType {
    let symbolName: String
    let typeName: String
}

struct Task {
    var taskName: String
    var taskDescription: String
    var seconds: Int
    var taskType: TaskType
    
    var timeStamp: Double
}

enum CountDownState {
    case suspended
    case running
    case paused
}
