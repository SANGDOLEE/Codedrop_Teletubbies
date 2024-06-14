
import Foundation
import SwiftData

@Model
class TaskBadData: Identifiable {
    
    @Attribute(.unique) var id = UUID()
    
    var taskBadTitle: String
    var taskBadContent: String
    var taskBadDate: Date
    
   
    init(taskBadTitle: String, taskBadContent: String, taskBadDate: Date) {
        self.taskBadTitle = taskBadTitle
        self.taskBadContent = taskBadContent
        self.taskBadDate = taskBadDate
    }
    
}
