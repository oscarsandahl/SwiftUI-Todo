//
//  ListCard.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-09-22.
//

import SwiftUI

struct ListCardView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            HStack(spacing: 15) {
                ZStack {
                    Text(viewModel.image)
                        .font(.title)
                        .padding(8)
                        .background(Color(viewModel.color))
                        .clipShape(Circle())
                }
                Text(viewModel.listTitle)
                    .lineLimit(1)
                    .multilineTextAlignment(.center)
                Spacer()
                Text("\(viewModel.items.count)")
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ListCard_Previews: PreviewProvider {
    static var previews: some View {
        ListCardView(viewModel: .init(image: "🎾", color: "Pink", listTitle: "Title", items: []))
            .previewLayout(.sizeThatFits)
    }
}
