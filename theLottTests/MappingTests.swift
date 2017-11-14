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
        // Read from JSON file in the bundle
        guard let path = Bundle.main.path(forResource: "response", ofType: "json") else {
                XCTFail("Response JSON file not found")
                return
            }
        do {
            let rawJSONData = try Data(contentsOf: URL(fileURLWithPath: path))
        
            let responseJSON = try JSON(data: rawJSONData)
            
            // Map the JSON response to array of Company
            let companies = Mapper<Company>().mapArray(JSONObject: responseJSON["Companies"].arrayObject)
            
            XCTAssertNotNil(companies, "Companies should not be nil")
        } catch {
            XCTFail("Could not read from JSON file")
        }
    }
    
}
