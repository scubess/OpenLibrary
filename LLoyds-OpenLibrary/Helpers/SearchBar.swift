//
//  SearchBar.swift
//  LLoyds-OpenLibrary
//
//  Created by Selva Chinnakalai on 06/11/2024.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var query: String
    var onSearchButtonClicked: () -> Void

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var query: String
        var onSearchButtonClicked: () -> Void

        init(query: Binding<String>, onSearchButtonClicked: @escaping () -> Void) {
            _query = query
            self.onSearchButtonClicked = onSearchButtonClicked
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            query = searchText
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            onSearchButtonClicked()
            searchBar.resignFirstResponder()
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(query: $query, onSearchButtonClicked: onSearchButtonClicked)
    }

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.delegate = context.coordinator
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = query
    }
}

