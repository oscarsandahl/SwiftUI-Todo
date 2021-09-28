//
//  ListCard.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-09-22.
//

import SwiftUI

struct ListCardViewModel {
    var listTitle: String
    var image: String
}

struct ListCardView: View {
    @Binding var viewModel: ListCardViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 15) {
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
