//
//  ProjectModalViewModel.swift
//  ProjectManager
//
//  Created by 재재, 언체인 on 2022/09/13.
//

import SwiftUI

final class ProjectModalViewModel: ObservableObject {
    var project: ProjectEntity

    @Published var title: String
    @Published var detail: String
    @Published var date: Date
    @Published var id: UUID
    @Published var status: String
    @Published var isEditable = true

    init(project: ProjectEntity = ProjectEntity()) {
        self.project = project
        self.title = project.title ?? ""
        self.detail = project.detail ?? ""
        self.date = project.date ?? Date()
        self.id = project.id ?? UUID()
        self.status = project.status ?? Status.todo.rawValue
    }

    func isTappedEditButton() {
        isEditable = false
    }
}
