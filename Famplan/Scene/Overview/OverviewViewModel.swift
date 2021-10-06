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
}

extension OverviewViewModel {
    func populateMockLists() {
        lists = [
            ListOverview(listTitle: "Title", image: "💎", items: 4),
            ListOverview(listTitle: "Title", image: "💰", items: 6),
            ListOverview(listTitle: "Title", image: "🔑", items: 3)
        ]
    }
}
