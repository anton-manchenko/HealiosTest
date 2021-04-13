//
//  CommentView.swift
//  HealiosTest
//
//  Created by Anton on 13.04.2021.
//

import SwiftUI

struct CommentView: View {
    let comment: String
    let name: String
    let email: String
    
    var body: some View {
        VStack(alignment: .leading) {
            (Text(name).font(.subheadline) + Text(" (\(email))").font(.footnote)).padding(.bottom, 5)
            Text(comment)
        }
    }
}
