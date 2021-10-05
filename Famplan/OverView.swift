//
//  OverView.swift
//  Famplan
//
//  Created by Sandahl, Oscar on 2021-09-22.
//

import SwiftUI

struct OverView: View {
    @ObservedObject private var viewModel = OverviewViewModel()
    
    var index: Int {
        viewModel.lists.count + 1
    }
    
    @State private var showingSheet = false
    
    //MARK: - View
    var body: some View {
        NavigationView {
            List {
                ForEach($viewModel.lists) { cell in
                    NavigationLink(destination: Text("New List")) {
                        ListCardView(viewModel: cell)
                    }
                }
            }
            .navigationTitle("Title")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    ToolBarButtonView(viewModel: ToolBarButtonViewModel(action: {
                        showingSheet.toggle()
                    }))
                        .sheet(isPresented: $showingSheet) {
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
