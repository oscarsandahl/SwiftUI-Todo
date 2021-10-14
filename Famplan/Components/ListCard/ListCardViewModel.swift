//
//  ListCardViewModel.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-10-14.
//

import Foundation
import SwiftUI

extension ListCardView {
    final class ViewModel: ObservableObject {
        @Published private(set) var image: String
        @Published private(set) var color: String
        @Published private(set) var listTitle: String
        @Published private(set) var items: [ListItem]
        
        init(image: String, color: String, listTitle: String, items: [ListItem]) {
            self.image = image
            self.color = color
            self.listTitle = listTitle
            self.items = items
        }
    }
}
