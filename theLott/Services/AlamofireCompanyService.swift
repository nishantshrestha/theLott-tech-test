//
//  AlamofireCompanyService.swift
//  theLott
//
//  Created by Nishant Shrestha on 15/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON

struct AlamofireCompanyService: CompanyService {
    
    func getCompanies(completionHandler: @escaping (Result<[Company]>) -> ()) {
        Alamofire.request("https://api.tatts.com/svc/sales/vmax/web/data/lotto/companies").validate().responseJSON { (response) in
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let responseJSON = try JSON(data: data)
                        if let success = responseJSON["Success"].bool {
                            if success {
                                guard let companies = Mapper<Company>().mapArray(JSONObject: responseJSON["Companies"].arrayObject) else {
                                    completionHandler(.error("Companies could not be mapped to model objects. Please ensure that JSON response is in correct format."))
                                    return
                                }
                                
                                completionHandler(.success(companies))
                            } else {
                                let error = responseJSON["ErrorInfo"].string ?? "Something went wrong while trying to fetch companies."
                                completionHandler(.error(error))
                            }
                        }
                    } catch {
                        completionHandler(.error("Could not map response to JSON"))
                    }
                }
            case .failure(let error):
                completionHandler(.error(error.localizedDescription))
            }
        }
    }
}
