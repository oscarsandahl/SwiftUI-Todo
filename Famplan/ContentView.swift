//
//  ContentView.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-09-22.
//

import SwiftUI

struct ContentView: View {
    @State var mockLists: [ListCardViewModel] = [
        ListCardViewModel(listTitle: "List 1", image: "🛍", items: 0),
        ListCardViewModel(listTitle: "List 2", image: "📝", items: 5),
        ListCardViewModel(listTitle: "List 3", image: "💰", items: 8)
    ]
    
    var index: Int {
        mockLists.count + 1
    }
    
    @State private var showingSheet = false
    
    //MARK: - View
    var body: some View {
        NavigationView {
            List {
                ForEach($mockLists) { cell in
                    NavigationLink(destination: Text("New List")) {
                        ListCardView(viewModel: cell)
                    }
                }
            }
            .navigationTitle("Title")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    ToolBarButtonView(viewModel: ToolBarButtonViewModel(action: {
                        showingSheet.toggle()
                    }))
                        .sheet(isPresented: $showingSheet) {
                            NewListView()
                        }
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
