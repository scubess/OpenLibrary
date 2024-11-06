//
//  BooksRepository.swift
//  LLoyds-OpenLibrary
//
//  Created by Selva Chinnakalai on 06/11/2024.
//

import Foundation

protocol BooksRepository {
    func searchBooks(query: String, completion: @escaping (Result<[Book], Error>) -> Void)
    func getBookDetail(id: String, completion: @escaping (Result<BookDetail, Error>) -> Void)

}
