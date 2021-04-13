//
//  MasterView.swift
//  HealiosTest
//
//  Created by Anton on 12.04.2021.
//

import SwiftUI

struct MasterView: View {
    @ObservedObject var viewModel: MasterViewModel
    @State var detailViewModel: DetailViewModel = DetailViewModel()
    @State var isShowDetail = false
    
    init(viewModel: MasterViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<self.viewModel.posts.count, id: \.self) { index in
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: DetailView(viewModel: detailViewModel), isActive: $isShowDetail) { EmptyView() }
                        Button(self.viewModel.posts[index].title) {
                            detailViewModel
                                .applyStore(viewModel.store)
                                .selectPost(self.viewModel.posts[index])
                                .loadData()
                            self.isShowDetail = true
                        }.padding(.leading, 5).padding(.trailing, 25)
                        
                    }
                }
            }.navigationBarTitle("Posts")
        }.onAppear {
            self.viewModel.loadData()
        }
    }
}
