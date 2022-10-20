//
//  ProjectMainViewModel.swift
//  ProjectManager
//
//  Created by 재재, 언체인 on 2022/09/13.
//
import CoreData
import SwiftUI

final class ProjectMainViewModel: ObservableObject {
    var coreDataManager = CoreDataManager.shared

    var todoArray: [ProjectEntity] {
        coreDataManager.savedProjects.filter { $0.status == Status.todo.rawValue }
    }
    var doingArray: [ProjectEntity] {
        coreDataManager.savedProjects.filter { $0.status == Status.doing.rawValue }
    }
    var doneArray: [ProjectEntity] {
        coreDataManager.savedProjects.filter { $0.status == Status.done.rawValue }
    }

//    func delete(at offsets: IndexSet, status: Status) {
//        guard let remove = offsets.first else { return }
//        let filteredArray = projects.filter { todo in
//            todo.status ?? "" == status.rawValue
//        }
//        projects.removeAll { todo in
//            todo.id == filteredArray[remove].id
//        }
//    }
}
