//
//  Persistence.swift
//  ProjectManager
//
//  Created by 재재, 언체인 on 2022/09/08.
//

import CoreData
import Foundation

class CoreDataManager {
    let persistentStoreContainer: NSPersistentContainer
    static let shared = CoreDataManager()

    init() {
        persistentStoreContainer = NSPersistentContainer(name: "ProjectEntity")
        persistentStoreContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("\(error.localizedDescription)")
            }
        }
    }
}
