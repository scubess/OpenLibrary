//
//  SearchBooksUseCaseTests.swift
//  LLoyds-OpenLibraryTests
//
//  Created by Selva Chinnakalai on 06/11/2024.
//

import XCTest
@testable import LLoyds_OpenLibrary

class SearchBooksUseCaseTests: XCTestCase {
    
    var useCase: SearchBooksUseCase!
    var repository: BooksRepository!
    
    override func setUp() {
        super.setUp()
        repository = BooksRepositoryImpl(service: BooksService())
        useCase = SearchBooksUseCase(repository: repository)
    }
    
    override func tearDown() {
        useCase = nil
        repository = nil
        super.tearDown()
    }
    
    func testSearchBooksUseCase() {
        let expectation = self.expectation(description: "Books search completed")
        
        useCase.execute(query: "the lord of the rings") { result in
            switch result {
            case .success(let books):
                XCTAssertTrue(books.count > 0, "Books should be returned")
            case .failure(let error):
                XCTFail("Expected success but received error: \(error)")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}
