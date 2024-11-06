//
//  Book.swift
//  LLoyds-OpenLibrary
//
//  Created by Selva Chinnakalai on 06/11/2024.
//

import Foundation

struct Book: Identifiable, Codable {
    let id = UUID()
    let title: String
    let authorName: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case title
        case authorName = "author_name"
    }
}
