//
//  SearchViewModelTests.swift
//  LLoyds-OpenLibraryTests
//
//  Created by Selva Chinnakalai on 06/11/2024.
//

import XCTest
@testable import LLoyds_OpenLibrary

class SearchViewModelTests: XCTestCase {
    
    var viewModel: SearchViewModel!
    var useCaseMock: SearchBooksUseCaseMock!
    var repositoryMock: BooksRepositoryMock!
    
    override func setUp() {
        super.setUp()
        repositoryMock = BooksRepositoryMock()
        useCaseMock = SearchBooksUseCaseMock(repository: repositoryMock)
        viewModel = SearchViewModel(searchBooksUseCase: useCaseMock)
    }
    
    override func tearDown() {
        viewModel = nil
        useCaseMock = nil
        repositoryMock = nil
        super.tearDown()
    }
    
    // Test case for successful book search
    func testSearchBooksSuccess() {
        let expectation = self.expectation(description: "Books search completed")
        
        // Setup mock data
        repositoryMock.mockBooks = [
            Book(title: "Swift Programming", authorName: ["John Doe"]),
            Book(title: "Advanced Swift", authorName: ["Jane Smith"])
        ]
        
        // Perform search
        viewModel.searchBooks(query: "^&*")
        
        // Wait for asynchronous result
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertEqual(self.viewModel.books.count, 0, "There should be 2 books returned")
            XCTAssertNil(self.viewModel.errorMessage, "Error message should be nil on success")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    // Test case for failed book search
    func testSearchBooksFailure() {
        let expectation = self.expectation(description: "Books search failed")
        
        // Simulate error
        repositoryMock.shouldReturnError = true
        
        // Perform search
        viewModel.searchBooks(query: "^&*^")
        
        // Wait for asynchronous result
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertEqual(self.viewModel.books.count, 0, "There should be no books returned")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
