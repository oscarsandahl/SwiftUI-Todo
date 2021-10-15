//
//  ApiModels.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-10-06.
//

//TODO: Rename to DataModels

import Foundation

struct ListOverview: Identifiable, Decodable {
    var id, listTitle, image, color: String
    var items: [ListItem]
}

struct ListItem: Identifiable, Decodable {
    var id, title: String
    var checked: Bool
}
