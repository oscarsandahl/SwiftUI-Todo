//
//  OverviewViewModel.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-10-05.
//

import Foundation

final class OverviewViewModel: ObservableObject {
    @Published var lists: [ListCardViewModel] = []
    @Published var showingSheet = false
}

extension OverviewViewModel {
    func populateMockLists() {
        lists = [
            ListCardViewModel(listTitle: "List 1", image: "🛍", items: 0),
            ListCardViewModel(listTitle: "List 2", image: "📝", items: 5),
            ListCardViewModel(listTitle: "List 3", image: "💰", items: 8)
        ]
    }
}
