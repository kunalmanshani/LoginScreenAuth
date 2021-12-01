//
//  CountryDataModel.swift
//  LoginScreenAuth
//
//  Created by Gaditek on 24/11/2021.
//

import Foundation

struct Dns: Decodable {
    let configuration_version: String?
    let name: String
    let type: String
    let acknowledgement_server: String
    let port_number: Int
    let is_multiport: Int
    let multiport_range: String?
    let ip_translation: String
}

struct Protocols : Decodable {
    let proto : String
    let dns: [Dns]?
    
    enum CodingKeys: String, CodingKey {
        case proto = "protocol"
        case dns = "dns"
    }
    
    
    
}
struct DataCenters : Decodable {
    let id: Int
}

struct Countries: Decodable{
    
    let id: Int
    let name: String
    let iso_code: String
    let data_centers :[DataCenters]
    let protocols : [Protocols]
    
}

struct Body: Decodable {
    let countries : [Countries]
}

struct fullData : Decodable {
    let body: Body
}
