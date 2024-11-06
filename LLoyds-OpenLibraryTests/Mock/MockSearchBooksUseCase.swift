//
//  File.swift
//  LLoyds-OpenLibraryTests
//
//  Created by Selva Chinnakalai on 06/11/2024.
//

import Foundation
@testable import LLoyds_OpenLibrary

class SearchBooksUseCaseMock: SearchBooksUseCase {
    
    var shouldReturnError = false
    var mockBooks: [Book] = []
    
    override func execute(query: String, completion: @escaping (Result<[Book], Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Network error"])))
        } else {
            completion(.success(mockBooks))
        }
    }
}
