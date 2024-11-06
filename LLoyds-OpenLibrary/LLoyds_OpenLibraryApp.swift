//
//  LLoyds_OpenLibraryApp.swift
//  LLoyds-OpenLibrary
//
//  Created by Selva Chinnakalai on 06/11/2024.
//

import SwiftUI

@main
struct LLoyds_OpenLibraryApp: App {
    var body: some Scene {
        WindowGroup {
            let service = BooksService()
            let repository = BooksRepositoryImpl(service: service)
            let useCase = SearchBooksUseCase(repository: repository)
            let viewModel = SearchViewModel(searchBooksUseCase: useCase)
            SearchView(viewModel: viewModel)
        }
    }
}
