//
//  ProjectMainViewModel.swift
//  ProjectManager
//
//  Created by 재재, 언체인 on 2022/09/13.
//
import CoreData
import SwiftUI
import Combine

final class ProjectMainViewModel: ObservableObject {
    var coreDataManager = CoreDataManager.shared
    var store: AnyCancellable?

    @Published var todoArray: [ProjectEntity] = []
    @Published var doingArray: [ProjectEntity] = []
    @Published var doneArray: [ProjectEntity] = []

    func makeSink() {
        store = coreDataManager.$savedProjects
            .sink { saveProject in
                self.todoArray = saveProject.filter { $0.status == Status.todo.rawValue }
                self.doingArray = saveProject.filter { $0.status == Status.doing.rawValue }
                self.doneArray = saveProject.filter { $0.status == Status.done.rawValue }
        }
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
