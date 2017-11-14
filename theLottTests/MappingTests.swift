//
//  MappingTests.swift
//  theLottTests
//
//  Created by Nishant Shrestha on 14/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import XCTest
import SwiftyJSON
import ObjectMapper

class MappingTests: XCTestCase {
    
    func testSuccessfullyMapsJSONToCompaniesArray() {
        
        guard let companies = MockData().getCompanies() else {
            XCTFail("Companies should not be nil")
            return
        }
        
        XCTAssertTrue(companies.count == 5, "Companies count(\(companies.count)) should be equal to 5.")
    }
    
}
