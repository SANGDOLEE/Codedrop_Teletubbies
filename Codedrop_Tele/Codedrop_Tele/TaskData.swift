
import Foundation
import SwiftData

class TaskData: Identifiable {
    
    @Attribute(.unique) var id = UUID()
    
    var taskTitle: String
    var taskContent: String
    var taskDate: Date
    var taskState: Bool
    
    init(id: UUID = UUID(), taskTitle: String, taskContent: String, taskDate: Date, taskState: Bool) {
        self.id = id
        self.taskTitle = taskTitle
        self.taskContent = taskContent
        self.taskDate = taskDate
        self.taskState = taskState
    }
    
}
