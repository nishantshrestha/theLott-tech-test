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
    var errorEncountered = false
}

extension MockCompaniesTableViewDelegate: CompaniesTableViewModelDelegate {
    func didUpdateCompanyViewModels() {
        self.delegateMethodWasCalled = true
    }
    func didEncounterError() {
        self.errorEncountered = true
    }
}
