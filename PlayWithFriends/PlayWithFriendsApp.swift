//
//  PlayWithFriendsApp.swift
//  PlayWithFriends
//
//  Created by Yorgi Del Rio on 11/16/23.
//

import SwiftUI

@main
struct PlayWithFriendsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            //ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
            VerdadReto()
        }
    }
}
