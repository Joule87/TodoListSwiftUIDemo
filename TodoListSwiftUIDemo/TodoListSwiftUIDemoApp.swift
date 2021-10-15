//
//  TodoListSwiftUIDemoApp.swift
//  TodoListSwiftUIDemo
//
//  Created by Julio Collado on 28/7/21.
//

import SwiftUI

@main
struct TodoListSwiftUIDemoApp: App {
    
    @StateObject var listViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
