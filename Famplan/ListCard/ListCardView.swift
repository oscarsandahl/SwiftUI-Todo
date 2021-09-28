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
                Text(viewModel.image)
                    .font(.largeTitle)
                Text(viewModel.listTitle)
                    .lineLimit(1)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct ListCard_Previews: PreviewProvider {
    static var previews: some View {
        ListCardView(viewModel: .constant(ListCardViewModel(listTitle: "My List", image: "🛍"))).previewLayout(.fixed(width: 150, height: 100))
    }
}
