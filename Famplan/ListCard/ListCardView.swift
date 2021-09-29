//
//  ListCard.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-09-22.
//

import SwiftUI

struct ListCardView: View {
    @Binding var viewModel: ListCardViewModel
    
    var body: some View {
        ZStack {
            HStack(spacing: 15) {
                ZStack {
                    Text(viewModel.image)
                        .font(.title)
                        .padding(8)
                        .background(Color.orange.opacity(0.2))
                        .clipShape(Circle())
                }
                Text(viewModel.listTitle)
                    .lineLimit(1)
                    .multilineTextAlignment(.center)
                Spacer()
                Text("\(viewModel.items)")
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ListCard_Previews: PreviewProvider {
    static var previews: some View {
        ListCardView(viewModel: .constant(ListCardViewModel(listTitle: "My List", image: "🛍", items: 0))).previewLayout(.fixed(width: 300, height: 100))
    }
}
