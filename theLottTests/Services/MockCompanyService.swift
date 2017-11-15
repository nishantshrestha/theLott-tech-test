//
//  MockCompanyService.swift
//  theLottTests
//
//  Created by Nishant Shrestha on 14/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation

struct MockCompanyService: CompanyService {
    
    var state: ExpectedState
    
    // Allow configuration of MockCompanyService to return empty array as response.
    init(expectedState: ExpectedState = .some) {
        self.state = expectedState
    }
    
    func getCompanies(completionHandler: (Result<[Company]>) -> ()) {
        switch state {
            case .empty: completionHandler(.success([]))
            case .some: completionHandler(.success(MockData().getCompanies() ?? []))
            case .failure(let error): completionHandler(.error(error))
        }
    }
}
