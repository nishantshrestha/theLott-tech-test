//
//  SuccessfulState.swift
//  theLottTests
//
//  Created by Nishant Shrestha on 14/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation

// To be passed as a dependency to MockCompanyService that will determine what sort of network response it will return
enum ExpectedState {
    case some
    case empty
    case failure(String)
}
