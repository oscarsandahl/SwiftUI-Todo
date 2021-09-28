//
//  NewListView.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-09-28.
//

import SwiftUI

struct NewListView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Press to dismiss") {
                    dismiss()
                }
                .font(.title)
                .padding()
                .background(Color.black)
    }
}

struct NewList_Previews: PreviewProvider {
    static var previews: some View {
        NewListView()
    }
}
