//
//  ProjectEntity+extension.swift
//  ProjectManager
//
//  Created by 재재, 언체인 on 2022/09/28.
//

import Foundation
import CoreData

extension ProjectEntity: BaseModel {

    static var all: NSFetchRequest<ProjectEntity> {
        let request = ProjectEntity.fetchRequest()
        request.sortDescriptors = []
        return request
    }

        var orderStatus: Status {
            get {
                Status(rawValue: status ?? "") ?? .todo
            }
            set {
                status = newValue.rawValue
            }
        }
}
