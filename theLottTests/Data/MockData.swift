//
//  MockData.swift
//  theLottTests
//
//  Created by Nishant Shrestha on 14/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

struct MockData {
    
    public func getCompanies() -> [Company]? {
        // Read from JSON file in the bundle
        guard let path = Bundle.main.path(forResource: "response", ofType: "json") else {
            return nil
        }
        
        do {
            let rawJSONData = try Data(contentsOf: URL(fileURLWithPath: path))
            
            let responseJSON = try JSON(data: rawJSONData)
            
            // Map the JSON response to array of Company
            let companies = Mapper<Company>().mapArray(JSONObject: responseJSON["Companies"].arrayObject)
            
            return companies
        } catch {
            return nil
        }
    }
}
