//
//  GymListViewController.swift
//  FLM
//
//  Created by Sunil Kumar on 20/12/18.
//  Copyright © 2018 Sunil Kumar. All rights reserved.
//

import UIKit
import CoreLocation

class GymListViewController: UITableViewController {

    var viewModel: GymListViewModel!
    
    let service = GymService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = GymListViewModel(service: service, present: self)
        findUserLocation()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfGyms()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GymListCell", for: indexPath) as? GymListTableViewCell else {
            return UITableViewCell()
        }
        
        if let model = viewModel.gymAtRow(indexPath.row) {
            cell.configure(model: model)
        }
        return cell
    }
    

    //MARK: - Private methods
    func findUserLocation() {
        LocationManager.shared.findUserLocation(success: { [weak self] (location) in
            guard let location = location, let self = self else {
                return
            }
            print(location)
            self.fetchGyms(location: location)
            }, failure: {
                //alert to let user know, location not found
        })
    }
    
    func fetchGyms(location: CLLocationCoordinate2D) {
        viewModel.fetchGyms(location: location)
    }
}

extension GymListViewController: PresenterProtocol {
    
    func displayGyms() {
        tableView.reloadData()
    }
}
