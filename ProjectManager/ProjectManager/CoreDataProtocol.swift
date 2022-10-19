//
//  CoreDataProtocol.swift
//  ProjectManager
//
//  Created by 오경식 on 2022/10/19.
//

import Foundation
import CoreData

protocol CoreDataProtocol: ObservableObject {
    var container: NSPersistentContainer { get }
    func fetchProject(entity: inout [ProjectEntity])
    func addProject(entity: inout [ProjectEntity])
    func updateProject(entity: inout [ProjectEntity])
    func deleteProject(entity: inout [ProjectEntity])
    func saveProject(entity: inout [ProjectEntity])
}

extension CoreDataProtocol {
    func fetchProject(entity: inout [ProjectEntity]) {
        let request = NSFetchRequest<ProjectEntity>(entityName: "ProjectEntity")
        do {
            entity = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }

    func saveProject(entity: inout [ProjectEntity]) {
        do {
            try container.viewContext.save()
            fetchProject(entity: &entity)
        } catch {
            print("Error saving. \(error)")
        }
    }
}
