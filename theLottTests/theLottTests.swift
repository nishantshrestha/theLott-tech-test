//
//  theLottTests.swift
//  theLottTests
//
//  Created by Nishant Shrestha on 14/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import XCTest
@testable import theLott

class theLottTests: XCTestCase {
    
    func testSuccessfullyMapsJSONToCompaniesArray() {
        
        guard let companies = MockData().getCompanies() else {
            XCTFail("Companies should not be nil")
            return
        }
        
        XCTAssertTrue(companies.count == 5, "Companies count(\(companies.count)) should be equal to 5.")
    }
    
    func testTableViewModelCorrectlyHandlesEmptyCompaniesArray() {
        
        let service = ServiceFactory.mockEmptyCompaniesService
        let viewModel = CompaniesTableViewModel(service: service)
        
        XCTAssertTrue(viewModel.getNumberOfRowsInSection(section: 0) == 0, "Number of rows should be 0.")
    }
    
    func testTableViewModelCorrectlyHandlesNonEmptyCompaniesArray() {
        
        let service = ServiceFactory.mockNonEmptyCompaniesService
        let viewModel = CompaniesTableViewModel(service: service)
        
        XCTAssertTrue(viewModel.getNumberOfRowsInSection(section: 0) == 5, "Number of rows should be 5.")
    }
    
    func testTableViewModelCorrectlyHandlesErrorState() {
        
        let service = ServiceFactory.mockFailingComapnyService
        let viewModel = CompaniesTableViewModel(service: service)
        
        XCTAssertEqual(viewModel.errorMessage, "Something went wrong while fetching companies.", "View model should have the specified error message.")
        XCTAssertTrue(viewModel.getNumberOfRowsInSection(section: 0) == 0, "Number of rows should be 0.")
    }
    
    func testTableViewModelCorrectlyMapsCompaniesToCompaniesViewModel() {
        
        let service = ServiceFactory.mockNonEmptyCompaniesService
        let viewModel = CompaniesTableViewModel(service: service)
        
        if let firstCompanyViewModel = viewModel.companyViewModels.first {
            XCTAssertEqual(firstCompanyViewModel.description, "QLD Residents", "First company view model description does not match.")
            
            guard let url = firstCompanyViewModel.logoURL else {
                XCTFail("First company view model logoURL cannot be nil.")
                return
            }
            
            XCTAssertEqual(url, URL(string: "http://tim.media.tatts.com/TattsServices/Lotto/Companies/GoldenCasket_v1.png")!, "First company view model URL is incorrect")
        }
    }
    
}
