//
//  OverviewViewModel.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-10-05.
//

import Foundation

final class OverviewViewModel: ObservableObject {
    @Published var lists: [ListOverview] = []
    @Published var showingSheet = false
    
    func deleteFromList(at offsets: IndexSet) {
        lists.remove(atOffsets: offsets)
    }
}

extension OverviewViewModel {
    func populateMockLists() {
        lists = [
            ListOverview(listTitle: "Title", image: "💎", color: "Yellow", items: [
                ListItem(title: "Title", checked: false)
            ]),
            ListOverview(listTitle: "Title2", image: "💰", color: "Green", items: [
                ListItem(title: "Title2", checked: true),
                ListItem(title: "Title2", checked: false)
            ]),
            ListOverview(listTitle: "Title3", image: "🔑", color: "Red", items: [
                ListItem(title: "Title3", checked: false),
                ListItem(title: "Title3", checked: false),
                ListItem(title: "Title3", checked: false)
            ])
        ]
    }
}
