//
//  ListViewModel.swift
//  TodoListSwiftUIDemo
//
//  Created by Julio Collado on 10/10/21.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    private func getItems() {
        let newItems = [ ItemModel(title: "First Title", isCompleted: false),
                         ItemModel(title: "Second Title", isCompleted: true),
                         ItemModel(title: "Third Title", isCompleted: false)]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from indexSet: IndexSet, to index: Int) {
        items.move(fromOffsets: indexSet, toOffset: index)
    }
    
    func addItem(title: String) {
        let item = ItemModel(title: title, isCompleted: false)
        items.append(item)
    }
    
    func update(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isCompleted = !item.isCompleted
        }
    }
}
