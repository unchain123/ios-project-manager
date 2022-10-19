//
//  ProjectMainViewModel.swift
//  ProjectManager
//
//  Created by 재재, 언체인 on 2022/09/13.
//
import CoreData
import SwiftUI

final class ProjectMainViewModel: ObservableObject, CoreDataProtocol {
    func addProject(entity: inout [ProjectEntity]) {

    }

    func updateProject(entity: inout [ProjectEntity]) {

    }

    func deleteProject(entity: inout [ProjectEntity]) {
        
    }

    var container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "ProjectManager")
        container.loadPersistentStores { _, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        fetchProject(entity: &model)
    }

    @Published var model: [ProjectEntity] = []
    @Published var project: ProjectEntity?

    var todoArray: [ProjectEntity] {
        model.filter { $0.status == Status.todo.rawValue }
    }
    var doingArray: [ProjectEntity] {
        model.filter { $0.status == Status.doing.rawValue }
    }
    var doneArray: [ProjectEntity] {
        model.filter { $0.status == Status.done.rawValue }
    }

    func delete(at offsets: IndexSet, status: Status) {
        guard let remove = offsets.first else { return }
        let filteredArray = model.filter { todo in
            todo.status ?? "" == status.rawValue
        }
        model.removeAll { todo in
            todo.id == filteredArray[remove].id
        }
    }
}
