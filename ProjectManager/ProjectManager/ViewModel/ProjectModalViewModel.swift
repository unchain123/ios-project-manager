//
//  ProjectModalViewModel.swift
//  ProjectManager
//
//  Created by 재재, 언체인 on 2022/09/13.
//

import SwiftUI
import CoreData

final class ProjectModalViewModel: ObservableObject {
    var context: NSManagedObjectContext

    @Published var title: String = ""
    @Published var detail: String = ""
    @Published var date: Date = Date()
    @Published var id: UUID = UUID()
    @Published var status: Status = .todo
    @Published var isEditable = true

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func isTappedEditButton() {
        isEditable = false
    }

    func save() {
        do {
            let project = ProjectEntity(context: context)
            project.title = title
            project.detail = detail
            project.date = date
            project.status = status.rawValue
            project.id = id
            try? project.save()
        }
    }
    func update(projectId: NSManagedObjectID) {
        do {
            guard let project = try context.existingObject(with: projectId) as? ProjectEntity else {
                return
            }
            try project.save()
        } catch {
            print(error)
        }
    }
}
