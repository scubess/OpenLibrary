//
//  SearchBooksUseCase.swift
//  LLoyds-OpenLibrary
//
//  Created by Selva Chinnakalai on 06/11/2024.
//

import Foundation

class SearchBooksUseCase {
    private let repository: BooksRepository

    init(repository: BooksRepository) {
        self.repository = repository
    }

    func execute(query: String, completion: @escaping (Result<[Book], Error>) -> Void) {
        repository.searchBooks(query: query, completion: completion)
    }
    
    func fetchBookDetail(id: String, completion: @escaping (Result<BookDetail, Error>) -> Void) {
        repository.getBookDetail(id: id, completion: completion)
    }
}
