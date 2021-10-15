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
            ListOverview(id: UUID().uuidString, listTitle: "Title", image: "💎", color: "Yellow", items: [
                ListItem(id: UUID().uuidString, title: "Title", checked: false)
            ]),
            ListOverview(id: UUID().uuidString ,listTitle: "Title2", image: "💰", color: "Green", items: [
                ListItem(id: UUID().uuidString ,title: "Title2", checked: true),
                ListItem(id: UUID().uuidString ,title: "Title2", checked: false)
            ]),
            ListOverview(id: UUID().uuidString ,listTitle: "Title3", image: "🔑", color: "Red", items: [
                ListItem(id: UUID().uuidString ,title: "Title3", checked: false),
                ListItem(id: UUID().uuidString ,title: "Title3", checked: false),
                ListItem(id: UUID().uuidString ,title: "Title3", checked: false)
            ])
        ]
    }
}
