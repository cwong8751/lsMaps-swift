//
//  AddressAutoComplete.swift
//  lsMaps
//
//  Created by Carl on 8/27/25.
//

import Foundation

struct AddressAutoComplete: Codable {
    let results: [GeoapifyResult]
}

struct GeoapifyResult: Codable {
    let countryCode: String?
    let housenumber: String?
    let street: String?
    let country: String?
    let county: String?
    let datasource: DataSource?
    let postcode: String?
    let state: String?
    let stateCode: String?
    let countyCode: String?
    let district: String?
    let city: String?
    let lon: Double?
    let lat: Double?
    let resultType: String?
    let formatted: String?
    let addressLine1: String?
    let addressLine2: String?
    let timezone: Timezone?
    let plusCode: String?
    let plusCodeShort: String?
    let iso3166_2: String?
    let rank: Rank?
    let placeId: String?

    enum CodingKeys: String, CodingKey {
        case countryCode = "country_code"
        case housenumber
        case street
        case country
        case county
        case datasource
        case postcode
        case state
        case stateCode = "state_code"
        case countyCode = "county_code"
        case district
        case city
        case lon
        case lat
        case resultType = "result_type"
        case formatted
        case addressLine1 = "address_line1"
        case addressLine2 = "address_line2"
        case timezone
        case plusCode = "plus_code"
        case plusCodeShort = "plus_code_short"
        case iso3166_2
        case rank
        case placeId = "place_id"
    }
}

struct DataSource: Codable {
    let sourcename: String?
    let attribution: String?
    let license: String?
}

struct Timezone: Codable {
    let name: String?
    let offsetSTD: String?
    let offsetSTDSeconds: Int?
    let offsetDST: String?
    let offsetDSTSeconds: Int?
    let abbreviationSTD: String?
    let abbreviationDST: String?

    enum CodingKeys: String, CodingKey {
        case name
        case offsetSTD = "offset_STD"
        case offsetSTDSeconds = "offset_STD_seconds"
        case offsetDST = "offset_DST"
        case offsetDSTSeconds = "offset_DST_seconds"
        case abbreviationSTD = "abbreviation_STD"
        case abbreviationDST = "abbreviation_DST"
    }
}

struct Rank: Codable {
    let confidence: Double?
    let confidenceStreetLevel: Int?
    let matchType: String?

    enum CodingKeys: String, CodingKey {
        case confidence
        case confidenceStreetLevel = "confidence_street_level"
        case matchType = "match_type"
    }
}
