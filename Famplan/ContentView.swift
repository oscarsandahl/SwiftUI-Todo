//
//  ContentView.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-09-22.
//

import SwiftUI

struct ContentView: View {
    @State var mockLists: [ListCardViewModel] = [
        ListCardViewModel(listTitle: "List 1", image: "🛍"),
        ListCardViewModel(listTitle: "List 2", image: "🛍"),
        ListCardViewModel(listTitle: "List 3", image: "🛍")
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach($mockLists) { cell in
                        ListCardView(viewModel: cell)
                    }
                }
            }
            .navigationTitle("Title")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    ToolBarButton()
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
