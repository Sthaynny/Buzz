//
//  Article.swift
//  Buzz
//
//  Created by Igor Costa Nascimento on 30/01/25.
//

import Foundation


struct Article: Codable, Identifiable {
    let id: Int
    let author: String
    let title: String
    let description: String?
    let url: URL
    let urlToImage: URL
    let publishedAt: Date
    let content: String
}
