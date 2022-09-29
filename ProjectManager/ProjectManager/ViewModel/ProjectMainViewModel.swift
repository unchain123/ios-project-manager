//
//  ProjectMainViewModel.swift
//  ProjectManager
//
//  Created by 재재, 언체인 on 2022/09/13.
//

import SwiftUI
import CoreData

@MainActor
final class ProjectMainViewModel: NSObject, ObservableObject {
    @Published var model: [ProjectViewModel] = []
    @Published var project: ProjectViewModel?

    private let fetchedResultsController: NSFetchedResultsController<ProjectEntity>
    private (set) var context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context

        fetchedResultsController = NSFetchedResultsController(fetchRequest: ProjectEntity.all,
                                                              managedObjectContext: context,
                                                              sectionNameKeyPath: nil,
                                                              cacheName: nil)
        super.init()
        fetchedResultsController.delegate = self

        do {
            try fetchedResultsController.performFetch()
            guard let projects = fetchedResultsController.fetchedObjects else {
                return
            }
            self.model = projects.map(ProjectViewModel.init)
        } catch {
            print(error)
        }
    }

    var todoArray: [ProjectViewModel] {
        model.filter { $0.status.rawValue == Status.todo.rawValue }
    }
    var doingArray: [ProjectViewModel] {
        model.filter { $0.status.rawValue == Status.doing.rawValue }
    }
    var doneArray: [ProjectViewModel] {
        model.filter { $0.status.rawValue == Status.doing.rawValue  }
    }

    func deleteProject(projectId: NSManagedObjectID) {
        do {
            guard let project = try context.existingObject(with: projectId)
                    as? ProjectEntity else {
                return
            }
            try project.delete()
        } catch {
            print(error)
        }
    }

    func changeStatus(changeStatus: Status) {
        do {
            let project = ProjectEntity(context: context)
            project.status = changeStatus.rawValue
            try? project.save()
        }
    }
    //    func delete(at offsets: IndexSet, status: Status) {
    //        guard let remove = offsets.first else { return }
    //        let filteredArray = model.filter { todo in
    //            todo.status == status.rawValue
    //        }
    //        model.removeAll { todo in
    //            todo.id == filteredArray[remove].id
    //        }
    //    }
}

extension ProjectMainViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let projects = controller.fetchedObjects as? [ProjectEntity] else {
            return
        }
        self.model = projects.map(ProjectViewModel.init)
    }
}

struct ProjectViewModel: Identifiable, Hashable {
    private var project: ProjectEntity

    init(project: ProjectEntity) {
        self.project = project
    }

    var id: NSManagedObjectID {
        project.objectID
    }

    var detail: String {
        project.detail ?? ""
    }

    var title: String {
        project.title ?? ""
    }

    var status: Status {
        Status(rawValue: project.status ?? "") ?? .todo
    }

    var date: Date {
        project.date ?? Date()
    }
}
