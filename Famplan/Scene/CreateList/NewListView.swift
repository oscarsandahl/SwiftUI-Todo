//
//  NewListView.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-09-28.
//

import SwiftUI
import Combine

final class NewListViewModel: ObservableObject {
    @Published var inputField: String = ""
    
    let textLimit = 1
    
    let colors: [String] = [
        "Red",
        "Green",
        "Pink",
        "Yellow",
        "Orange",
        "Blue",
        "Purple",
        "Brown"
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
}

struct NewListView: View {
    @ObservedObject private var viewModel = NewListViewModel()
    @Binding var lists: [ListOverview]
    
    @Environment(\.dismiss) var dismiss
    @State private var iconField: String = "💰"
    @State private var selectedColor: String = "Black"
    
    func limitText(_ upper: Int) {
        if iconField.count > upper {
            iconField = String(iconField.prefix(upper))
        }
    }
    
    func createList() {
        lists.append(ListOverview(listTitle: viewModel.inputField, image: iconField, color: selectedColor, items: []))
    }

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        VStack(spacing: 20) {
                            TextField("", text: $iconField)
                                .onReceive(Just(iconField), perform: { _ in
                                    limitText(viewModel.textLimit)
                                })
                                .font(.system(size: 50))
                                .multilineTextAlignment(.center)
                                .lineLimit(1)
                                .padding(8)
                                .background(Color(selectedColor))
                                .clipShape(Circle())
                            TextField("List Name", text: $viewModel.inputField)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                    Section {
                        LazyVGrid(columns: viewModel.columns, spacing: 20) {
                            ForEach(viewModel.colors, id: \.self) { color in
                                Circle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color(color))
                                .onTapGesture {
                                    selectedColor = color
                                }
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
                        createList()
                        dismiss()
                    }
                    .disabled(viewModel.inputField.isEmpty || iconField.isEmpty)
                }
            }
        }
    }
}
