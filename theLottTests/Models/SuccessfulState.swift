//
//  SuccessfulState.swift
//  theLottTests
//
//  Created by Nishant Shrestha on 14/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation

// Since the JSON is returning an array of 'Companies', it might sometimes return an empty array. The UI and the View Model needs to cater for that.
// This is purely for testing purposes and is only used with the mock service class.
enum SuccessfulState {
    case some
    case empty
}
