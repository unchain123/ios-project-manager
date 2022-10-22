//
//  CoreDataManager.swift
//  ProjectManager
//
//  Created by 오경식 on 2022/10/19.
//

import Foundation
import CoreData

class CoreDataManager: ObservableObject {
    static let shared = CoreDataManager()
    let container: NSPersistentContainer
    @Published var savedProjects: [ProjectEntity] = []
    @Published var project: ProjectEntity = ProjectEntity()

    private init() {
        container = NSPersistentContainer(name: "ProjectManager")
        container.loadPersistentStores { _, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        fetchProject()
    }

    func fetchProject() {
        let request = NSFetchRequest<ProjectEntity>(entityName: "ProjectEntity")
        do {
            savedProjects = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }

    func saveProject() {
        do {
            try container.viewContext.save()
            fetchProject()
        } catch {
            print("Error saving. \(error)")
        }
    }

    func deleteProject(at offsets: IndexSet, status: Status) {
        guard let remove = offsets.first else { return }
        let filteredArray = savedProjects.filter { todo in
            todo.status ?? "" == status.rawValue
        }
        let deletedEntity = filteredArray[remove]
        container.viewContext.delete(deletedEntity)
        saveProject()
    }

    func addProject(id: UUID,
                    title: String,
                    detail: String,
                    date: Date,
                    status: String) {
        let newProject = ProjectEntity(context: container.viewContext)
        newProject.id = id
        newProject.title = title
        newProject.detail = detail
        newProject.date = date
        newProject.status = status
        saveProject()
    }

    func editToStatus(projects: [ProjectEntity], project: ProjectEntity, status: String) {
        projects.map { projectIndex in
            guard projectIndex.id == project.id else { return project }
            project.setValue(status, forKey: "status")
            return projectIndex
        }
        saveProject()
    }

    func editProject(projects: [ProjectEntity],
                     project: ProjectEntity,
                     title: String,
                     detail: String,
                     date: Date,
                     status: String
                    ) {
        projects.map { projectIndex in
            guard projectIndex.id == project.id else { return project }
            project.setValue(title, forKey: "title")
            project.setValue(detail, forKey: "detail")
            project.setValue(date, forKey: "date")
            project.setValue(status, forKey: "status")
            return projectIndex
        }
        saveProject()
    }
}
//                        projects = projects.map { project in
//                            guard project.id == viewModel.id else { return project }
//                            let changedProject = Project(id: viewModel.id,
//                                                         status: viewModel.status,
//                                                         title: viewModel.title,
//                                                         detail: viewModel.detail,
//                                                         date: viewModel.date)
//                            return changedProject
//                        }
