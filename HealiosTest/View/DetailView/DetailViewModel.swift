//
//  DetailViewModel.swift
//  HealiosTest
//
//  Created by Anton on 13.04.2021.
//

import SwiftUI
import Combine

class DetailViewModel: ObservableObject {
    private(set) unowned var store: AppStore!
    private var post: Post?
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    deinit {
        cancellableSet.removeAll()
    }
    
    @Published var title: String = ""
    @Published var body: String = ""
    @Published var user: String = ""
    @Published var comments: [Comment] = [Comment]()

    private func subscribe() {
        cancellableSet.removeAll()
        store.objectWillChange
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [unowned self] _ in
                if let error = self.store.state.hPostDetailState.error {
                    print(error)
                } else if !self.store.state.hPostDetailState.requesting,
                          !(self.store.state.hPostDetailState.comments?.isEmpty ?? true),
                          !(self.store.state.hPostDetailState.users?.isEmpty ?? true),
                          self.comments.isEmpty  {
                    self.loadData()
                }
            })
            .store(in: &cancellableSet)
    }
    func applyStore(_ store: AppStore) -> DetailViewModel {
        self.store = store
        self.subscribe()
        return self
    }
    func selectPost(_ post: Post) -> DetailViewModel {
        self.post = post
        return self
    }
    func loadData() {
        if let comments = self.store.state.hPostDetailState.comments,
           let users = self.store.state.hPostDetailState.users,
           let post = self.post,
           let user = users.first(where: { $0.id == post.userID }) {
            self.user = user.name
            self.title = post.title
            self.body = post.body
            self.comments.removeAll()
            self.comments.append(contentsOf: comments.filter{ $0.postID == post.id})
        } else {
            if self.store.state.hPostDetailState.users?.isEmpty ?? true {
                store.dispatch(HPostsDetailAction.requestUsers(store.service))
            }
            if self.store.state.hPostDetailState.comments?.isEmpty ?? true {
                store.dispatch(HPostsDetailAction.requestComments(store.service))
            }
        }
    }
}
