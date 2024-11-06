//
//  BookRow.swift
//  LLoyds-OpenLibrary
//
//  Created by Selva Chinnakalai on 06/11/2024.
//

import SwiftUI

struct BookRow: View {
    let book: Book
    
    var body: some View {
        Text(book.title)
            .padding()
        
    }
}
