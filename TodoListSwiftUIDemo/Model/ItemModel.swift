//
//  ItemModel.swift
//  TodoListSwiftUIDemo
//
//  Created by Julio Collado on 7/10/21.
//

import Foundation

struct ItemModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    var isCompleted: Bool
}
