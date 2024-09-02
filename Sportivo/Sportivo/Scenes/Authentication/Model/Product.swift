//
//  Product.swift
//  InDoor-User
//
//  Created by Alaa on 03/06/2023.
//

import Foundation


struct Product: Hashable, Codable {

    var id: Int
    var title: String?
    var bodyHtml: String?
    var vendor: String?
    var productType: String?
    var createdAt: String?
    var handle: String?
    var updatedAt: String?
    var publishedAt: String?
    var status: String?
    var publishedScope: String?
    var tags: String?
    var adminGraphqlApiId: String?
//    var variants: [Variants]?
//    var options: [Options]?
//    var images: [Image]?
//    var image: Image?
    var templateSuffix: String?
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case bodyHtml
        case vendor
        case productType
        case createdAt
        case handle
        case updatedAt
        case publishedAt
        case status
        case publishedScope
        case tags
        case adminGraphqlApiId
        case templateSuffix
    }

}
