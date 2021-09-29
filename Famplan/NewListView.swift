//
//  NewListView.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-09-28.
//

import SwiftUI

struct IconColors: Identifiable {
    let id = UUID()
    let color: Color
}

struct NewListView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    
    let colors: [IconColors] = [
        IconColors(color: Color.green.opacity(0.15)),
        IconColors(color: Color.red.opacity(0.15)),
        IconColors(color: Color.pink.opacity(0.15)),
        IconColors(color: Color.yellow.opacity(0.15)),
        IconColors(color: Color.orange.opacity(0.15)),
        IconColors(color: Color.blue.opacity(0.15)),
        IconColors(color: Color.black.opacity(0.15)),
        IconColors(color: Color.brown.opacity(0.15))
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
                                .background(Color.orange.opacity(0.15))
                                .clipShape(Circle())
                            TextField("List Name", text: $name)
                                .padding()
                                .background(Color.gray.opacity(0.15))
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                    Section {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(colors) { color in
                                Button("") {
                                    print("Tapped")
                                }
                                .frame(width: 50, height: 50)
                                .background(color.color)
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
