//
//  BooksService.swift
//  LLoyds-OpenLibrary
//
//  Created by Selva Chinnakalai on 06/11/2024.
//

import Foundation

class BooksService {
    private let baseURL = "https://openlibrary.org/search.json"
    
    func searchBooks(query: String, completion: @escaping (Result<[Book], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)?q=\(query)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                return
            }
            do {
                let result = try JSONDecoder().decode(SearchResponse.self, from: data)
                completion(.success(result.docs))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    func getBookDetail(by id: String, completion: @escaping (Result<BookDetail, Error>) -> Void) {
        guard let url = URL(string: "https://openlibrary.org/works/\(id).json") else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                return
            }
            do {
                let detail = try JSONDecoder().decode(BookDetail.self, from: data)
                completion(.success(detail))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

struct SearchResponse: Codable {
    let docs: [Book]
}
