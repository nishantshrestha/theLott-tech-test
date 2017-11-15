//
//  JSONMappingTests.swift
//  theLottTests
//
//  Created by Nishant Shrestha on 15/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import XCTest

class JSONMappingTests: XCTestCase {
    
    // Test whether the JSON response gets mapped correctly to the model object
    func testJSONResponseGetsMappedToCompanyArray() {
        
        guard let companies = MockData().getCompanies() else {
            XCTFail("Companies should not be nil")
            return
        }
        
        XCTAssertTrue(companies.count == 5, "Companies count(\(companies.count)) should be equal to 5.")
    }
    
}
