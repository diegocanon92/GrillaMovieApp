//
//  ResponseBodyModel.swift
//  GrillaMovieApp
//
//  Created by Diego Ernesto MacbookAir  on 22/06/23.
//

import Foundation

// MARK: - Welcome
struct ResponseBodyModel: Codable {
    let page: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let original_title: String
    let poster_path: String?
}
