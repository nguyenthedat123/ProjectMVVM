//
//  CatResponse.swift
//  ProjectFinal
//
//  Created by The Dat on 7/15/21.
//

import Foundation

// MARK: - CatResponse
struct CatResponse: Codable {
    let id: Int
    let url: String
    let webpurl: String
    let x, y: Double
}
