//
//  CompanyViewModelTests.swift
//  theLottTests
//
//  Created by Nishant Shrestha on 15/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import XCTest

class CompanyViewModelTests: XCTestCase {
    
    // Test whether CompanyViewModel gets initialised correctly with a Company object.
    func testViewModelGetsInitialisedCorrectly() {
        
        let company = Company(id: "myCompany", displayName: "Test Company", description: "theLott", logoURL: "http://placehold.it/500")
        
        let viewModel = CompanyViewModel(company: company)
        
        XCTAssertEqual(viewModel.description, "theLott", "View model description is incorrect.")
        XCTAssertEqual(viewModel.logoURL, URL(string: "http://placehold.it/500"), "View model logoURL is incorrect.")
        
    }
    
}
