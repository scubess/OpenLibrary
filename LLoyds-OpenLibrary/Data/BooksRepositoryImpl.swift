//
//  BooksRepositoryImpl.swift
//  LLoyds-OpenLibrary
//
//  Created by Selva Chinnakalai on 06/11/2024.
//

import Foundation

class BooksRepositoryImpl: BooksRepository {
    private let service: BooksService

    init(service: BooksService) {
        self.service = service
    }

    func searchBooks(query: String, completion: @escaping (Result<[Book], Error>) -> Void) {
        service.searchBooks(query: query, completion: completion)
    }
    
    func getBookDetail(id: String, completion: @escaping (Result<BookDetail, Error>) -> Void) {
            service.getBookDetail(by: id, completion: completion)
    }
}
