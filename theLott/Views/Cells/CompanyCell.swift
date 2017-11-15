//
//  CompanyCell.swift
//  theLott
//
//  Created by Nishant Shrestha on 15/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import UIKit

class CompanyCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var companyViewModel: CompanyViewModel? {
        didSet {
            guard let companyViewModel = companyViewModel else { return }
            nameLabel.text = companyViewModel.description
            logoImageView.kf.setImage(with: companyViewModel.logoURL, placeholder: #imageLiteral(resourceName: "placeholder_company"))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
