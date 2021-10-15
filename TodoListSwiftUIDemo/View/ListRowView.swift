//
//  ListRowView.swift
//  TodoListSwiftUIDemo
//
//  Created by Julio Collado on 28/7/21.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? Color.green : Color.gray)
            Text(item.title)
            Spacer()
        }
        .font(.title)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        let item = ItemModel(title: "Some item", isCompleted: false)
        ListRowView(item: item)
            .previewLayout(.sizeThatFits)
    }
}
