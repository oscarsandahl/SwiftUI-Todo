//
//  ToolBarButtonView.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-09-28.
//

import SwiftUI

struct ToolBarButtonView: View {
    let viewModel: ViewModel
    
    var body: some View {
        Button(action: viewModel.action) {
            HStack {
                Image(systemName: "plus.circle.fill")
                    .font(.title2)
                Text("New List")
                    .fontWeight(.semibold)
            }
        }
    }
}

extension ToolBarButtonView {
    struct ViewModel {
        let action: () -> Void
    }
}

struct ToolBarButton_Previews: PreviewProvider {
    static var previews: some View {
        ToolBarButtonView(viewModel: .init(action: {}))
    }
}
