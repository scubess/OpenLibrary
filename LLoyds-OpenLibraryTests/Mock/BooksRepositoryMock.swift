//
//  BooksRepositoryMock.swift
//  LLoyds-OpenLibraryTests
//
//  Created by Selva Chinnakalai on 06/11/2024.
//

import Foundation
@testable import LLoyds_OpenLibrary

class BooksRepositoryMock: BooksRepository {

    var shouldReturnError = false
    var mockBooks: [Book] = []
    
    func searchBooks(query: String, completion: @escaping (Result<[Book], Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Network error"])))
        } else {
            completion(.success(mockBooks))
        }
    }
    
    //TODO:
    func getBookDetail(id: String, completion: @escaping (Result<LLoyds_OpenLibrary.BookDetail, Error>) -> Void) {
        
    }
}

