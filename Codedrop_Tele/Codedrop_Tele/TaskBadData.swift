
import Foundation
import SwiftData

@Model
class TaskBadData: Identifiable {
    
    @Attribute(.unique) var id = UUID()
    
    var taskBadTitle: String
    var taskBadContent: String
    var taskBadDate: Date
    
   
    init(id: UUID = UUID(), taskBadTitle: String, taskBadContent: String, taskBadDate: Date) {
        self.id = id
        self.taskBadTitle = taskBadTitle
        self.taskBadContent = taskBadContent
        self.taskBadDate = taskBadDate
    }
    
}
