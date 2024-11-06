//
//  SearchViewTests.swift
//  LLoyds-OpenLibraryTests
//
//  Created by Selva Chinnakalai on 06/11/2024.
//

import XCTest
@testable import LLoyds_OpenLibrary

class BooksServiceTests: XCTestCase {
    
    var service: BooksService!
    
    override func setUp() {
        super.setUp()
        service = BooksService()
    }
    
    override func tearDown() {
        service = nil
        super.tearDown()
    }
    
    func testSearchBooksSuccess() {
        let expectation = self.expectation(description: "Books search completed")
        
        service.searchBooks(query: "the lord of the rings") { result in
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
    
    func testSearchBooksFailure() {
        let expectation = self.expectation(description: "Books search completed")
        
        service.searchBooks(query: "^&*^") { result in
            switch result {
            case .success:
                XCTFail("Expected failure but received success")
            case .failure:
                XCTAssertTrue(true, "Expected failure due to wrong query")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
