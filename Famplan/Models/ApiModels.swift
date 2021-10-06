//
//  ApiModels.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-10-06.
//

import Foundation

struct ListOverview: Identifiable, Decodable {
    var id = UUID()
    var listTitle: String
    var image: String
    var color: String
    var items: Int
}
