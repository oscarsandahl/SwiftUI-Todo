//
//  SelectedListView.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-10-14.
//

import SwiftUI

extension SelectedListView {
    final class ViewModel: ObservableObject {
        private(set) var title: String
        @Published private(set) var items: [ListItem]
        
        init(title: String, items: [ListItem]) {
            self.title = title
            self.items = items
        }
        
        func deleteFromList(at offsets: IndexSet) {
            items.remove(atOffsets: offsets)
        }
        
        func checkmarkTapped(cell: ListItem) {
            if let index = items.firstIndex(where: { $0.id == cell.id }) {
                items[index].checked.toggle()
            }
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
                    Button(action: {
                        viewModel.checkmarkTapped(cell: cell)
                    }) {
                        Image(systemName: cell.checked ? "checkmark.circle.fill" : "circle")
                            .font(.title2)
                    }
                    .buttonStyle(.borderless)
                }
            }
            .onDelete(perform: viewModel.deleteFromList)
        }
        .navigationTitle(viewModel.title)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                ToolBarButtonView(viewModel: .init(action: {
                    
                }))
                Spacer()
            }
        }
    }
}

struct SelectedListView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedListView(viewModel: .init(title: "Title", items: [ListItem(id: "123", title: "Title", checked: false)]))
    }
}
