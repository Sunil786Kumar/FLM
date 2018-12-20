//
//  GymListViewController.swift
//  FLM
//
//  Created by Sunil Kumar on 20/12/18.
//  Copyright © 2018 Sunil Kumar. All rights reserved.
//

import UIKit

class GymListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Nearest Gyms"
        findUserLocation()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    //MARK: - Private methods
    func findUserLocation() {
        LocationManager.shared.findUserLocation(success: { [weak self] (location) in
            guard let location = location, let self = self else {
                return
            }
            print(location)
            //self.fetchGyms(location: location)
            }, failure: {
                //alert to let user know, location not found
        })
    }

}
