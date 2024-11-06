//
//  IdentifiableError.swift
//  LLoyds-OpenLibrary
//
//  Created by Selva Chinnakalai on 06/11/2024.
//

import Foundation

struct IdentifiableError: Identifiable {
    var id = UUID()
    let message: String
}
