//
//  ToolBarButton.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-09-28.
//

import SwiftUI

struct ToolBarButton: View {
    var body: some View {
        Button(action: {
            print("b")
        }) {
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
        ToolBarButton().previewLayout(.sizeThatFits)
    }
}
