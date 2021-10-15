//
//  OverView.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-09-22.
//

import SwiftUI

struct OverView: View {
    @ObservedObject private var viewModel = OverviewViewModel()
    
    //MARK: - View
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.lists) { cell in
                    NavigationLink(destination: SelectedListView(viewModel: .init(items: cell.items))) {
                        ListCardView(viewModel: .init(image: cell.image, color: cell.color, listTitle: cell.listTitle, items: cell.items))
                    }
                }
                .onDelete(perform: viewModel.deleteFromList)
            }
            .navigationTitle("Title")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    ToolBarButtonView(viewModel: .init(action: {
                        viewModel.showingSheet.toggle()
                    }))
                        .sheet(isPresented: $viewModel.showingSheet) {
                            NewListView(lists: $viewModel.lists)
                        }
                    Spacer()
                }
            }
        }.onAppear {
            viewModel.populateMockLists()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OverView()
    }
}
