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
        lists = []
    }
}
