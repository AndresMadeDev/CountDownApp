//
//  CountDownAppApp.swift
//  CountDownApp
//
//  Created by Andres Made on 1/21/24.
//

import SwiftUI
import SwiftData

@main
struct CountDownAppApp: App {
    var body: some Scene {
        WindowGroup {
            EventHomeView()
                .modelContainer(for: Event.self)
        }
    }
}
