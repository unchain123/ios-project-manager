//
//  ProjectModalViewModel.swift
//  ProjectManager
//
//  Created by 재재, 언체인 on 2022/09/13.
//

import SwiftUI
import CoreData

final class ProjectModalViewModel: ObservableObject {
    var coreDataManager = CoreDataManager.shared

    var project: ProjectEntity

    @Published var title: String = ""
    @Published var detail: String = ""
    @Published var date: Date = Date()
    @Published var id: UUID
    @Published var status: String = Status.todo.rawValue
    @Published var isEditable = true

    init(project: ProjectEntity = ProjectEntity(), id: UUID = UUID()) {
        self.project = project
        self.id = id

    }

    func isTappedEditButton() {
        isEditable = false
    }
}
