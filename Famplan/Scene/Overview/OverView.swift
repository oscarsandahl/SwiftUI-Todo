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
                    NavigationLink(destination: Text("New List")) {
                        ListCardView(listOverview: ListOverview(listTitle: cell.listTitle, image: cell.image, color: cell.color, items: cell.items))
                    }
                }
            }
            .navigationTitle("Title")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    ToolBarButtonView(viewModel: ToolBarButtonViewModel(action: {
                        viewModel.showingSheet.toggle()
                    }))
                        .sheet(isPresented: $viewModel.showingSheet) {
                            NewListView()
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
