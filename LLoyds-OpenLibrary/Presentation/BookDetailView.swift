//
//  BookDetailView.swift
//  LLoyds-OpenLibrary
//
//  Created by Selva Chinnakalai on 06/11/2024.
//

import SwiftUI

struct BookDetailView: View {
    let book: Book
    @State private var bookDetail: BookDetail?

    var body: some View {
        VStack {
            Text(book.title).font(.title).padding()

            if let authors = bookDetail?.authors {
                Text("Authors: \(authors.joined(separator: ", "))")
            }

            if let description = bookDetail?.description {
                Text(description)
                    .padding()
            }
        }
        .onAppear {
            // Fetch book details when view appears
        }
    }
}
