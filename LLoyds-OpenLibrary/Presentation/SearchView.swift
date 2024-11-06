//
//  SearchView.swift
//  LLoyds-OpenLibrary
//
//  Created by Selva Chinnakalai on 06/11/2024.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel: SearchViewModel

    init(viewModel: SearchViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    @State private var query = ""

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(query: $query, onSearchButtonClicked: {
                    // set up a mock auth token for demoing keychain purpose
                    viewModel.storeAuthToken(token: "mockAuthToken1234567890")
                    // Retrieve auth token from Keychain
                    if let authToken = viewModel.retrieveAuthToken() {
                        print("Auth token retrieved: \(authToken)")
                    } else {
                        print("No auth token found.")
                    }

                    // Perform search
                    viewModel.searchBooks(query: query)
                })

                List(viewModel.books) { book in
                    NavigationLink(destination: BookDetailView(book: book)) {
                        BookRow(book: book)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Book Search")
            .alert(item: $viewModel.errorMessage) { error in
                Alert(
                    title: Text("Error"),
                    message: Text(error.message),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .onAppear {
            // You can call viewModel.storeAuthToken(token:) if you want to store a new token here
        }
    }
}
