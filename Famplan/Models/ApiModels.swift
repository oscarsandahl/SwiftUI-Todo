//
//  ApiModels.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-10-06.
//

import Foundation

struct ListOverview: Identifiable, Decodable {
    var id = UUID()
    var listTitle, image, color: String
    var items: [ListItem]
}

struct ListItem: Identifiable, Decodable {
    var id = UUID()
    var title: String
    var checked: Bool
}
