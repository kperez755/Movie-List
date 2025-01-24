//
//  MoviesSwiftUIApp.swift
//  MoviesSwiftUI
//
//  Created by Kevin Perez on 1/12/25.
//

import SwiftUI

@main
struct MoviesSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView(httpClient: HTTPClient())
            }
        }
    }
}
