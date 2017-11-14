//
//  CompanyService.swift
//  theLott
//
//  Created by Nishant Shrestha on 14/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation

protocol CompanyService {
    func getCompanies(completionHandler: (Result<[Company]>) -> ())
}
