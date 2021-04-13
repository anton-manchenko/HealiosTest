//
//  MasterViewModel.swift
//  HealiosTest
//
//  Created by Anton on 12.04.2021.
//

import SwiftUI
import Combine

class MasterViewModel: ObservableObject {
    private(set) unowned var store: AppStore!
    
    @Published var posts: [Post] = [Post]()
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    deinit {
        cancellableSet.removeAll()
    }
    
    func applyStore(_ store: AppStore) -> MasterViewModel {
        self.store = store
        self.subscribe()
        return self
    }
    
    private func subscribe() {
        cancellableSet.removeAll()
        store.objectWillChange
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [unowned self] _ in
                if let error = self.store.state.hPostsState.error {
                    print(error)
                } else if !self.store.state.hPostsState.requesting, self.posts.isEmpty  {
                    self.loadData()
                }
            })
            .store(in: &cancellableSet)
    }
    
    func loadData() {
        if let posts = self.store.state.hPostsState.posts {
            self.posts.append(contentsOf: posts)
        } else {
            self.posts.removeAll()
            store.dispatch(HPostsAction.requestPosts(store.service))
        }
    }
}
