//
//  CompanyViewModel.swift
//  theLott
//
//  Created by Nishant Shrestha on 14/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation

class CompanyViewModel {
    
    private var company: Company
    
    init(company: Company) {
        self.company = company
    }
    
    var logoURL: URL? {
        return URL(string: company.logoURL)
    }
    
    var description: String {
        return company.description
    }
    
}
