//
//  NewListView.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-09-28.
//

import SwiftUI
import Combine

final class NewListViewModel: ObservableObject {
    @Environment(\.dismiss) var dismiss
    @Published var inputField: String = ""
    
    let textLimit = 1
    
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
}

struct NewListView: View {
    @ObservedObject private var viewModel = NewListViewModel()
    
    @State private var iconField: String = "💰"
    @State private var selectedColor: Color = Color("Black")
    
    func limitText(_ upper: Int) {
        if iconField.count > upper {
            iconField = String(iconField.prefix(upper))
        }
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
                                .background(selectedColor)
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
                            ForEach(viewModel.colors, id:  \.self) { color in
                                Circle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(color)
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
                        viewModel.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        print("Done Tapped!")
                    }
                    .disabled(viewModel.inputField.isEmpty || iconField.isEmpty)
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
