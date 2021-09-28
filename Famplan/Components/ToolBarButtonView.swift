//
//  ToolBarButtonView.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-09-28.
//

import SwiftUI

struct ToolBarButtonViewModel {
    let action: () -> Void
}

struct ToolBarButtonView: View {
    let viewModel: ToolBarButtonViewModel
    
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

struct ToolBarButton_Previews: PreviewProvider {
    static var previews: some View {
        ToolBarButtonView(viewModel: ToolBarButtonViewModel(action: {})).previewLayout(.sizeThatFits)
    }
}
