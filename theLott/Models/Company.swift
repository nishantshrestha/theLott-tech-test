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
    
    var id: String!
    var displayName: String!
    var description: String!
    var logoURL: String!
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["CompanyId"]
        displayName <- map["CompanyDisplayName"]
        description <- map["CompanyDescription"]
        logoURL <- map["CompanyLogoUrl"]
    }
}
