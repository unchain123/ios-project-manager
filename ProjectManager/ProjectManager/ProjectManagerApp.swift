//
//  ProjectManagerApp.swift
//  ProjectManager
//
//  Created by 재재, 언체인 on 2022/09/08.
//

import SwiftUI

@main
struct ProjectManagerApp: App {
    var body: some Scene {
        WindowGroup {
            let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
            ProjectMainView(viewContext: ProjectMainViewModel(context: viewContext))
                .environment(\.managedObjectContext, viewContext)
        }
    }
}
