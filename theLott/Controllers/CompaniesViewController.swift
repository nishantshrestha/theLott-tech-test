//
//  CompaniesViewController.swift
//  theLott
//
//  Created by Nishant Shrestha on 15/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import UIKit

class CompaniesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension CompaniesViewController {
    static func storyboardInstance() -> CompaniesViewController? {
        let className = String(describing: self)
        
        return UIStoryboard(name: className, bundle: nil).instantiateInitialViewController() as? CompaniesViewController
    }
}
