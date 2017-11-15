//
//  CompaniesTableViewViewModel.swift
//  theLott
//
//  Created by Nishant Shrestha on 14/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation

class CompaniesTableViewModel {
    
    let service: CompanyService
    
    var companyViewModels: [CompanyViewModel] = []
    
    var errorMessage: String?
    
    init(service: CompanyService) {
        self.service = service
        
        fetchCompanies()
    }
    
    func fetchCompanies() {
        service.getCompanies { (result) in
            switch result {
            case .error(let error):
                self.errorMessage = error
            case .success(let companies):
                self.companyViewModels = companies.flatMap(CompanyViewModel.init)
            }
        }
    }
    
    func getNumberOfSections() -> Int {
        return 1
    }
    
    func getNumberOfRowsInSection(section: Int) -> Int {
        return companyViewModels.count
    }
    
}
