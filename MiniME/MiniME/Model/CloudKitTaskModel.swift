//
//  TaskList.swift
//  MiniME
//
//  Created by Milena Maia Araújo on 13/06/23.
//

import Foundation
import CloudKit

struct Task {
    let title: String
    let id: CKRecord.ID?
//    let minutesTime: Int
//    let hourTime: Int
//    let mode: Int
//    let priority: String
    
//    init(title: String, id: CKRecord.ID? = nil, minutesTime: Int, hourTime: Int, mode: Int, priority: String) {
    init(title: String, id: CKRecord.ID? = nil) {
        self.title = title
        self.id = id
//        self.minutesTime = minutesTime
//        self.hourTime = hourTime
//        self.mode = mode
//        self.priority = priority
    }
    
    func toDictionary() -> [String: Any]{
        return ["title": title]
    }
    
    static func fromRecord(_ record: CKRecord) -> Task? {
        guard let title = record.value(forKey: "title") as? String else {
            return nil
        }
        return Task(title: title, id: record.recordID)
    }
}
