//
//  DetailView.swift
//  HealiosTest
//
//  Created by Anton on 13.04.2021.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        ScrollView(showsIndicators: true) {
            VStack(alignment:.leading) {
                Text(viewModel.title).font(.headline).padding(.bottom, 10)
                Text(viewModel.body).font(.body)
                Divider()
                Text("Comments:").padding([.top, .bottom], 10)
                
                LazyVStack(alignment: .leading) {
                    ForEach(0..<self.viewModel.comments.count, id: \.self) { index in
                        CommentView(comment: self.viewModel.comments[index].body,
                                    name: self.viewModel.comments[index].name,
                                    email: self.viewModel.comments[index].email)
                        Divider()
                        
                    }
                }
                
            }
        }
        .padding(15)
        .navigationBarTitle("By: \(viewModel.user)")
    }
}
