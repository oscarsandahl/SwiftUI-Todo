//
//  NewListView.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-09-28.
//

import SwiftUI

struct NewListView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        VStack(spacing: 20) {
                            Text("💰")
                                .font(.system(size: 50))
                                .padding(5)
                                .background(Color.orange.opacity(0.15))
                                .clipShape(Capsule())
                            TextField("Te", text: $name)
                                .padding()
                                .background(Color.gray.opacity(0.15))
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                }
            }
            .navigationBarTitle("New List", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        print("Help tapped!")
                    }
                    .disabled(true)
                }
            }
        }
    }
}

struct NewList_Previews: PreviewProvider {
    static var previews: some View {
        NewListView()
    }
}
