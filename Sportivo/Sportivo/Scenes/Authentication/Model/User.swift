//
//  Customer.swift
//  InDoor-User
//
//  Created by Mac on 11/06/2023.
//

import Foundation


//struct User: Codable {
//    let customer: Customer?
//}
//
//// MARK: - Customer
//struct Customer: Codable {
//    let id: Int?
//    let email: String?
//    let createdAt, updatedAt: Date?
//    let firstName, lastName: String?
//    let ordersCount: Int?
//    let state, totalSpent: String?
//    let lastOrderID, note: JSONNull?
//    let verifiedEmail: Bool?
//    let multipassIdentifier: JSONNull?
//    let taxExempt: Bool?
//    let tags: String?
//    let lastOrderName: JSONNull?
//    let currency, phone: String?
//    let addresses: [Address]?
//    let taxExemptions: [JSONAny]?
//    let emailMarketingConsent, smsMarketingConsent: MarketingConsent?
//    let adminGraphqlAPIID: String?
//    let defaultAddress: Address?
//
//    enum CodingKeys: String, CodingKey {
//        case id, email
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case ordersCount = "orders_count"
//        case state
//        case totalSpent = "total_spent"
//        case lastOrderID = "last_order_id"
//        case note
//        case verifiedEmail = "verified_email"
//        case multipassIdentifier = "multipass_identifier"
//        case taxExempt = "tax_exempt"
//        case tags
//        case lastOrderName = "last_order_name"
//        case currency, phone, addresses
//        case taxExemptions = "tax_exemptions"
//        case emailMarketingConsent = "email_marketing_consent"
//        case smsMarketingConsent = "sms_marketing_consent"
//        case adminGraphqlAPIID = "admin_graphql_api_id"
//        case defaultAddress = "default_address"
//    }
//}
//
//// MARK: - Address
//struct Address: Codable {
//    let id, customerID: Int?
//    let firstName, lastName: String?
//    let company: JSONNull?
//    let address1: String?
//    let address2: JSONNull?
//    let city, province, country, zip: String?
//    let phone, name, provinceCode, countryCode: String?
//    let countryName: String?
//    let addressDefault: Bool?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case customerID = "customer_id"
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case company, address1, address2, city, province, country, zip, phone, name
//        case provinceCode = "province_code"
//        case countryCode = "country_code"
//        case countryName = "country_name"
//        case addressDefault = "default"
//    }
//}
//
//// MARK: - MarketingConsent
//struct MarketingConsent: Codable {
//    let state, optInLevel: String?
//    let consentUpdatedAt: JSONNull?
//    let consentCollectedFrom: String?
//
//    enum CodingKeys: String, CodingKey {
//        case state
//        case optInLevel = "opt_in_level"
//        case consentUpdatedAt = "consent_updated_at"
//        case consentCollectedFrom = "consent_collected_from"
//    }
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//            return true
//    }
//
//    public var hashValue: Int {
//            return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//            let container = try decoder.singleValueContainer()
//            if !container.decodeNil() {
//                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//            }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//            var container = encoder.singleValueContainer()
//            try container.encodeNil()
//    }
//}
//
//class JSONCodingKey: CodingKey {
//    let key: String
//
//    required init?(intValue: Int) {
//            return nil
//    }
//
//    required init?(stringValue: String) {
//            key = stringValue
//    }
//
//    var intValue: Int? {
//            return nil
//    }
//
//    var stringValue: String {
//            return key
//    }
//}
//
//class JSONAny: Codable {
//
//    let value: Any
//
//    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
//            let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
//            return DecodingError.typeMismatch(JSONAny.self, context)
//    }
//
//    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
//            let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
//            return EncodingError.invalidValue(value, context)
//    }
//
//    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
//            if let value = try? container.decode(Bool.self) {
//                    return value
//            }
//            if let value = try? container.decode(Int64.self) {
//                    return value
//            }
//            if let value = try? container.decode(Double.self) {
//                    return value
//            }
//            if let value = try? container.decode(String.self) {
//                    return value
//            }
//            if container.decodeNil() {
//                    return JSONNull()
//            }
//            throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
//            if let value = try? container.decode(Bool.self) {
//                    return value
//            }
//            if let value = try? container.decode(Int64.self) {
//                    return value
//            }
//            if let value = try? container.decode(Double.self) {
//                    return value
//            }
//            if let value = try? container.decode(String.self) {
//                    return value
//            }
//            if let value = try? container.decodeNil() {
//                    if value {
//                            return JSONNull()
//                    }
//            }
//            if var container = try? container.nestedUnkeyedContainer() {
//                    return try decodeArray(from: &container)
//            }
//            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
//                    return try decodeDictionary(from: &container)
//            }
//            throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
//            if let value = try? container.decode(Bool.self, forKey: key) {
//                    return value
//            }
//            if let value = try? container.decode(Int64.self, forKey: key) {
//                    return value
//            }
//            if let value = try? container.decode(Double.self, forKey: key) {
//                    return value
//            }
//            if let value = try? container.decode(String.self, forKey: key) {
//                    return value
//            }
//            if let value = try? container.decodeNil(forKey: key) {
//                    if value {
//                            return JSONNull()
//                    }
//            }
//            if var container = try? container.nestedUnkeyedContainer(forKey: key) {
//                    return try decodeArray(from: &container)
//            }
//            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
//                    return try decodeDictionary(from: &container)
//            }
//            throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
//            var arr: [Any] = []
//            while !container.isAtEnd {
//                    let value = try decode(from: &container)
//                    arr.append(value)
//            }
//            return arr
//    }
//
//    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
//            var dict = [String: Any]()
//            for key in container.allKeys {
//                    let value = try decode(from: &container, forKey: key)
//                    dict[key.stringValue] = value
//            }
//            return dict
//    }
//
//    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
//            for value in array {
//                    if let value = value as? Bool {
//                            try container.encode(value)
//                    } else if let value = value as? Int64 {
//                            try container.encode(value)
//                    } else if let value = value as? Double {
//                            try container.encode(value)
//                    } else if let value = value as? String {
//                            try container.encode(value)
//                    } else if value is JSONNull {
//                            try container.encodeNil()
//                    } else if let value = value as? [Any] {
//                            var container = container.nestedUnkeyedContainer()
//                            try encode(to: &container, array: value)
//                    } else if let value = value as? [String: Any] {
//                            var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
//                            try encode(to: &container, dictionary: value)
//                    } else {
//                            throw encodingError(forValue: value, codingPath: container.codingPath)
//                    }
//            }
//    }
//
//    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
//            for (key, value) in dictionary {
//                    let key = JSONCodingKey(stringValue: key)!
//                    if let value = value as? Bool {
//                            try container.encode(value, forKey: key)
//                    } else if let value = value as? Int64 {
//                            try container.encode(value, forKey: key)
//                    } else if let value = value as? Double {
//                            try container.encode(value, forKey: key)
//                    } else if let value = value as? String {
//                            try container.encode(value, forKey: key)
//                    } else if value is JSONNull {
//                            try container.encodeNil(forKey: key)
//                    } else if let value = value as? [Any] {
//                            var container = container.nestedUnkeyedContainer(forKey: key)
//                            try encode(to: &container, array: value)
//                    } else if let value = value as? [String: Any] {
//                            var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
//                            try encode(to: &container, dictionary: value)
//                    } else {
//                            throw encodingError(forValue: value, codingPath: container.codingPath)
//                    }
//            }
//    }
//
//    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
//            if let value = value as? Bool {
//                    try container.encode(value)
//            } else if let value = value as? Int64 {
//                    try container.encode(value)
//            } else if let value = value as? Double {
//                    try container.encode(value)
//            } else if let value = value as? String {
//                    try container.encode(value)
//            } else if value is JSONNull {
//                    try container.encodeNil()
//            } else {
//                    throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//    }
//
//    public required init(from decoder: Decoder) throws {
//            if var arrayContainer = try? decoder.unkeyedContainer() {
//                    self.value = try JSONAny.decodeArray(from: &arrayContainer)
//            } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
//                    self.value = try JSONAny.decodeDictionary(from: &container)
//            } else {
//                    let container = try decoder.singleValueContainer()
//                    self.value = try JSONAny.decode(from: container)
//            }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//            if let arr = self.value as? [Any] {
//                    var container = encoder.unkeyedContainer()
//                    try JSONAny.encode(to: &container, array: arr)
//            } else if let dict = self.value as? [String: Any] {
//                    var container = encoder.container(keyedBy: JSONCodingKey.self)
//                    try JSONAny.encode(to: &container, dictionary: dict)
//            } else {
//                    var container = encoder.singleValueContainer()
//                    try JSONAny.encode(to: &container, value: self.value)
//            }
//    }
//}

//struct User: Codable {
//    var id: Int?
//    var firstName: String?
//    var lastName: String?
//    var email :String?
//    var phone: String?
//    var addresses: [Address]?
////    var tags: String?
//    var note: String?
//    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case note
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case email, phone
//        case addresses
////        , tags
//    }
//}
struct User: Codable {
    let customer: Customer
}

// MARK: - Customer
struct Customer: Codable {
    let id: Int
    let email: String
    let createdAt: String
    let updatedAt: String
    let firstName: String
    let lastName: String
    let ordersCount: Int
    let state: String
    let totalSpent: String
    let phone: String
    let verifiedEmail: Bool
    let currency: String
    let addresses: [Address]
    let taxExemptions: [String]
    let emailMarketingConsent: MarketingConsent
    let smsMarketingConsent: MarketingConsent
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case firstName = "first_name"
        case lastName = "last_name"
        case ordersCount = "orders_count"
        case state
        case totalSpent = "total_spent"
        case phone
        case verifiedEmail = "verified_email"
        case currency
        case addresses
        case taxExemptions = "tax_exemptions"
        case emailMarketingConsent = "email_marketing_consent"
        case smsMarketingConsent = "sms_marketing_consent"
    }
}

// MARK: - Address
struct Address: Codable {
    // Define properties of Address if necessary
}

// MARK: - MarketingConsent
struct MarketingConsent: Codable {
    let state: String
    let optInLevel: String
    let consentUpdatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case state
        case optInLevel = "opt_in_level"
        case consentUpdatedAt = "consent_updated_at"
    }
}
