//
//  ContentView.swift
//  HealiosTest
//
//  Created by Anton on 12.04.2021.
//

import Combine
import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var store: AppStore
    @State var viewModel: MasterViewModel = MasterViewModel()
    
    var body: some View {
        MasterView(viewModel: viewModel.applyStore(self.store))
    }
}

