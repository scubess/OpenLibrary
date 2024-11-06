//
//  BooksRepositoryTests.swift
//  LLoyds-OpenLibraryTests
//
//  Created by Selva Chinnakalai on 06/11/2024.
//

import XCTest
@testable import LLoyds_OpenLibrary

class BooksRepositoryTests: XCTestCase {
    
    var repository: BooksRepository!
    var service: BooksService!
    
    override func setUp() {
        super.setUp()
        service = BooksService()
        repository = BooksRepositoryImpl(service: service)
    }
    
    override func tearDown() {
        repository = nil
        service = nil
        super.tearDown()
    }
    
    func testSearchBooks() {
        let expectation = self.expectation(description: "Books search completed")
        
        repository.searchBooks(query: "the lord of the rings") { result in
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
