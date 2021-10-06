//
//  ListCard.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-09-22.
//

import SwiftUI

struct ListCardView: View {
    var listOverview: ListOverview
    
    var body: some View {
        ZStack {
            HStack(spacing: 15) {
                ZStack {
                    Text(listOverview.image)
                        .font(.title)
                        .padding(8)
                        .background(Color("Yellow"))
                        .clipShape(Circle())
                }
                Text(listOverview.listTitle)
                    .lineLimit(1)
                    .multilineTextAlignment(.center)
                Spacer()
                Text("\(listOverview.items)")
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ListCard_Previews: PreviewProvider {
    static var previews: some View {
        ListCardView(listOverview: ListOverview(listTitle: "Title", image: "💎", items: 7)).previewLayout(.sizeThatFits)
    }
}
