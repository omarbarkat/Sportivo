//
//  AddUserModel.swift
//  Sportivo
//
//  Created by eng.omar on 02/09/2024.
//

import Foundation

struct Response: Codable {
    let product: Product?
    let products: [Product]?
    let smartCollections: [SmartCollections]?
    let customCollections: [CustomCollections]?
    let currencies: [Currency]?
    let base: String?
    let rates: Rates?
    let customer: User?
    let customers: [User]?
    let addresses: [Address]?
    let customer_address: Address?
//    let draftOrder: DraftOrder?
//    let orders: [Orders]?
//    let order: Orders?
//    var priceRules: [PriceRule]?
//    var priceRule: PriceRule?
//    var discountCodes: [DiscountCodes]?
//    var discountCode: DiscountCodes?
//    var inventoryLevel: InventoryLevel?
//    var inventoryItem: InventoryItem?
//    var variant:Variants?
    

    enum CodingKeys: CodingKey {
        case product
        case products
        case smartCollections
        case customCollections
        case currencies
        case base
        case rates
        case customer
        case customers
        case addresses
        case customer_address
    }
}
