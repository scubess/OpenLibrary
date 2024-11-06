//
//  BookDetail.swift
//  LLoyds-OpenLibrary
//
//  Created by Selva Chinnakalai on 06/11/2024.
//

import Foundation

struct BookDetail: Codable {
    let title: String
    let authors: [String]
    let description: String?
    
    private enum CodingKeys: String, CodingKey {
        case title
        case authors = "authors"
        case description
    }
}
