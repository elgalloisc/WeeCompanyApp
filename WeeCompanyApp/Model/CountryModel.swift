//
//  CountryModel.swift
//  WeeCompanyApp
//
//  Created by Antonio Garcia Espíndola on 23/07/24.
//

import Foundation

struct CountryModel: Codable {
    var name: Name
    var capital: [String]?
    var currencies: [String: Currency]?
    var maps: Maps
    var flags: Flags
    
    struct Name: Codable {
        var common, official: String
    }
    
    struct Currency: Codable {
        var name, symbol: String
    }
    
    struct Maps: Codable {
        var googleMaps: String
    }
    
    struct Flags: Codable {
        var png: String
    }
}
