//
//  Star_Wars_AppApp.swift
//  Star Wars App
//
//  Created by Livia Ochmann on 22.10.23.
//

import SwiftUI

@main
struct Star_Wars_AppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(SwapiModel()) // Share the view model with the whole app
        }
    }
}
