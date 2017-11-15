//
//  MockDelegator.swift
//  theLottTests
//
//  Created by Nishant Shrestha on 15/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation

class MockCompaniesTableViewDelegate {
    
    var delegateMethodWasCalled = false
    var companyViewModels: [CompanyViewModel] = []
}

extension MockCompaniesTableViewDelegate: CompaniesTableViewModelDelegate {
    func didUpdateCompanyViewModels(companyViewModels: [CompanyViewModel]) {
        print("-------")
        print("hello what is going on")
        print(companyViewModels)
        print("--------")
        self.delegateMethodWasCalled = true
        self.companyViewModels = companyViewModels
    }
}
