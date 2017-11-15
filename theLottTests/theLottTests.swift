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
        
        let service = ServiceFactory.mockFailingCompaniesService
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
    
    func testTableViewModelDelegateMethodGetsCalled() {
        
        let service = ServiceFactory.mockNonEmptyCompaniesService
        let viewModel = CompaniesTableViewModel(service: service)
        let mockDelegate = MockCompaniesTableViewDelegate()
        viewModel.delegate = mockDelegate
        
        viewModel.fetchCompanies() // I am refetching companies because the didSet operation happens instantaneously(during initialisation of the viewmodel) when using the mocked company service. This results in the delegate not being set until AFTER the didSet invocation and delegate methods not being called.
        
        XCTAssertTrue(mockDelegate.delegateMethodWasCalled, "Delegate method was not called.")
    }
    
}
