//
//  SelectedListView.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-10-14.
//

import SwiftUI

extension SelectedListView {
    final class ViewModel: ObservableObject {
        @Published private(set) var items: [ListItem]
        
        init(items: [ListItem]) {
            self.items = items
        }
        
        func deleteFromList(at offsets: IndexSet) {
            items.remove(atOffsets: offsets)
        }
    }
}

struct SelectedListView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.items) { cell in
                HStack {
                    Text(cell.title)
                    Spacer()
                    Image(systemName: cell.checked ? "checkmark.circle.fill" : "circle")
                }
            }
            .onDelete(perform: viewModel.deleteFromList)
        }
    }
}

struct SelectedListView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedListView(viewModel: .init(items: [ListItem(title: "Title", checked: false)]))
    }
}
