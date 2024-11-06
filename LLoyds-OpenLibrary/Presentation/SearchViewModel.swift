//
//  SearchViewModel.swift
//  LLoyds-OpenLibrary
//
//  Created by Selva Chinnakalai on 06/11/2024.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var books: [Book] = []
    @Published var errorMessage: IdentifiableError?

    private let searchBooksUseCase: SearchBooksUseCase

    // The key for storing the token in Keychain
    private let keychainKey = "auth_token"

    init(searchBooksUseCase: SearchBooksUseCase) {
        self.searchBooksUseCase = searchBooksUseCase
    }

    // Method to retrieve the token from Keychain
    func retrieveAuthToken() -> String? {
        return KeychainService.getData(key: keychainKey)
    }

    // Method to store the token in Keychain
    func storeAuthToken(token: String) {
        let _ = KeychainService.saveData(key: keychainKey, data: token)
    }

    func searchBooks(query: String) {
        searchBooksUseCase.execute(query: query) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let books):
                    self?.books = books
                case .failure(let error):
                    self?.errorMessage = IdentifiableError(message: error.localizedDescription)
                }
            }
        }
    }
}
