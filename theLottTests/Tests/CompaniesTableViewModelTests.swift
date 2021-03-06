//
//  theLottTests.swift
//  theLottTests
//
//  Created by Nishant Shrestha on 14/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import XCTest
@testable import theLott

class CompaniesTableViewModelTests: XCTestCase {
    
    // Test that the view model returns correct row count when dealing with an empty data set.
    func testViewModelCorrectlyHandlesEmptyCompaniesArray() {
        
        let service = ServiceFactory.mockEmptyCompaniesService
        let viewModel = CompaniesTableViewModel(service: service)
        
        XCTAssertTrue(viewModel.getNumberOfRowsInSection(section: 0) == 0, "Number of rows should be 0.")
    }
    
    // Test that the view model returns correct row count when dealing with non-empty data set.
    func testViewModelCorrectlyHandlesNonEmptyCompaniesArray() {
        
        let service = ServiceFactory.mockNonEmptyCompaniesService
        let viewModel = CompaniesTableViewModel(service: service)
        
        XCTAssertTrue(viewModel.getNumberOfRowsInSection(section: 0) == 5, "Number of rows should be 5.")
    }
    
    // Test that the view model returns correct row count when dealing with an erroneous data set; and also sets the correct error message.
    func testViewModelCorrectlyHandlesErrorState() {
        
        let service = ServiceFactory.mockFailingCompaniesService
        let viewModel = CompaniesTableViewModel(service: service)
        
        XCTAssertEqual(viewModel.errorMessage, "Something went wrong while fetching companies.", "View model should have the specified error message.")
        XCTAssertTrue(viewModel.getNumberOfRowsInSection(section: 0) == 0, "Number of rows should be 0.")
    }
    
    // Test that the CompaniesTableViewModel contains an array of correctly mapped CompanyViewModels.
    func testViewModelContainsCorrectlyMappedCompanyViewModels() {
        
        let service = ServiceFactory.mockNonEmptyCompaniesService
        
        let viewModel = CompaniesTableViewModel(service: service)
        
        XCTAssertTrue(viewModel.companyViewModels.count == 5, "Company view model count should be 5.")
        
        if let firstCompanyViewModel = viewModel.companyViewModels.first {
            XCTAssertEqual(firstCompanyViewModel.description, "QLD Residents", "First company view model description does not match.")
            
            guard let url = firstCompanyViewModel.logoURL else {
                XCTFail("First company view model logoURL cannot be nil.")
                return
            }
            
            XCTAssertEqual(url, URL(string: "http://tim.media.tatts.com/TattsServices/Lotto/Companies/GoldenCasket_v1.png")!, "First company view model URL is incorrect")
        }
    }
    
    // Test that the delegate function gets called when the companies are successfully fetched.
    func testViewModelDelegateMethodGetsCalled() {
        
        let service = ServiceFactory.mockNonEmptyCompaniesService
        let viewModel = CompaniesTableViewModel(service: service)
        let mockDelegate = MockCompaniesTableViewDelegate()
        viewModel.delegate = mockDelegate
        
        viewModel.fetchCompanies() // I am refetching companies because the didSet operation happens instantaneously(during initialisation of the viewmodel) when using the mocked company service. This results in the delegate not being set until AFTER the didSet invocation and delegate methods not being called.
        
        XCTAssertTrue(mockDelegate.delegateMethodWasCalled, "Delegate method was not called.")
    }
    
}
