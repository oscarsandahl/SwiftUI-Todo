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
    
    let colors: [Color] = [
        Color("Green"),
        Color("Red"),
        Color("Pink"),
        Color("Yellow"),
        Color("Orange"),
        Color("Blue"),
        Color("Purple"),
        Color("Brown")
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        VStack(spacing: 20) {
                            Text("💰")
                                .font(.system(size: 50))
                                .padding(8)
                                .background(Color("Black"))
                                .clipShape(Circle())
                            TextField("List Name", text: $name)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                    Section {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(colors, id:  \.self) { color in
                                Button("") {
                                    print("s")
                                }
                                .frame(width: 50, height: 50)
                                .background(color)
                                .clipShape(Circle())
                            }
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                    }
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
                        print("Done Tapped!")
                    }
                    .disabled(true)
                }
            }
        }
    }
}

struct NewList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NewListView()
        }
    }
}
