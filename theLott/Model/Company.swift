//
//  Company.swift
//  theLott
//
//  Created by Nishant Shrestha on 14/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation
import ObjectMapper

struct Company: Mappable {
    
    let id: String!
    let displayName: String!
    let description: String!
    let logoURL: String!
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["CompanyId"]
        displayName <- map["CompanyDisplayName"]
        description <- map["CompanyDescription"]
        logoURL <- map["CompanyLogoUrl"]
    }
}
