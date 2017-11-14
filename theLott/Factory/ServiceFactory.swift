//
//  ServiceFactory.swift
//  theLott
//
//  Created by Nishant Shrestha on 14/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation

// Define dependencies
struct ServiceFactory {
    
    // Mock company service that returns a non-empty [Company] array
    static var mockNonEmptyCompaniesService: CompanyService {
        return MockCompanyService()
    }
    
    // Mock company service that return empty [Company] array
    static var mockEmptyCompaniesService: CompanyService {
        return MockCompanyService(expectedState: .empty)
    }
}