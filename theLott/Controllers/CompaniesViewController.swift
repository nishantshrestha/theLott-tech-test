//
//  CompaniesViewController.swift
//  theLott
//
//  Created by Nishant Shrestha on 15/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import UIKit
import Kingfisher

class CompaniesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var companiesTableViewModel: CompaniesTableViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        companiesTableViewModel = CompaniesTableViewModel(service: ServiceFactory.productionCompaniesService)
        companiesTableViewModel.delegate = self
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        // auto-resizing
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // remove separators
        tableView.tableFooterView = UIView()
    }

}

extension CompaniesViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return companiesTableViewModel?.getNumberOfSections() ?? 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companiesTableViewModel?.getNumberOfRowsInSection(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let viewModel = companiesTableViewModel.companyViewModels[indexPath.row]
        cell.textLabel?.text = viewModel.description
        if let logoURL = viewModel.logoURL {
            cell.imageView?.kf.setImage(with: viewModel.logoURL)
        } else {
            cell.imageView?.image = nil
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension CompaniesViewController: CompaniesTableViewModelDelegate {
    func didUpdateCompanyViewModels() {
        self.tableView.reloadData()
    }
    
    func didEncounterError() {
        if let errorMessage = companiesTableViewModel.errorMessage {
            // show error alert
            let alertView = UIAlertController(title: "theLott", message: errorMessage, preferredStyle: .alert)
            
            let retryAction = UIAlertAction(title: "Retry", style: .default, handler: { [weak self](_) in
                self?.companiesTableViewModel.fetchCompanies()
                self?.dismiss(animated: true, completion: nil)
            })
            alertView.addAction(retryAction)
            
            present(alertView, animated: true, completion: nil)
        }
    }
}

extension CompaniesViewController {
    static func storyboardInstance() -> CompaniesViewController? {
        let className = String(describing: self)
        
        return UIStoryboard(name: className, bundle: nil).instantiateInitialViewController() as? CompaniesViewController
    }
}
