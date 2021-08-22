//
//  TaskViewModel.swift
//  TaskCountDownUIKit
//
//  Created by Thor on 22/08/2021.
//

import Foundation


class TaskViewModel{
    private var task: Task!
    
    private let taskTypes: [TaskType] = [
        TaskType(symbolName: "star", typeName: "Priority"),
        TaskType(symbolName: "iphone", typeName: "Develop"),
        TaskType(symbolName: "gamecontroller", typeName: "Gaming"),
        TaskType(symbolName: "wand.and.stars.inverse", typeName: "Editing")
    ]
    
    private var selectedIndex = -1 {
        didSet{
            self.task.taskType = self.getTaskTypes()[selectedIndex]
        }
    }
    
    private var hours = Box(0)
    private var mintues = Box(0)
    private var seconds = Box(0)
    
    init() {
        task = Task(
            taskName: "",
            taskDescription: "",
            seconds: 0 ,
            taskType: .init(symbolName: "", typeName: ""),
            timeStamp: 0.0)
    }
    
    
    func setSelectedIndex(to value: Int){
        self.selectedIndex = value
    }
    
    func setTaskName(to value: String){
        self.task.taskName = value
    }
    
    func setTaskDescription(to value: String){
        self.task.taskDescription = value
    }
    
    func getSelectedIndex() -> Int {
        return self.selectedIndex
    }
    
    func getTask() ->Task {
        return self.task
    }
    
    func getTaskTypes() -> [TaskType] {
        return self.taskTypes
    }
    
}
