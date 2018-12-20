//
//  GymListViewModel.swift
//  FLM
//
//  Created by Sunil Kumar on 20/12/18.
//  Copyright © 2018 Sunil Kumar. All rights reserved.
//

import Foundation
import CoreLocation

protocol PresenterProtocol {
    func displayGyms()
}

class GymListViewModel {

    var gyms: [Gym]?
    
    var gymService: GymServiceProtocol?
    
    var presenter: PresenterProtocol?
    
    init(service: GymServiceProtocol, present: PresenterProtocol) {
        gymService = service
        presenter = present
    }
    
    func fetchGyms(location: CLLocationCoordinate2D) {
        
        guard let service = gymService else {
            return
        }
        
        service.fetchGyms(location: location) { [weak self] (nearestGyms) in
            
            //return nearestGyms
            guard let allGyms = nearestGyms, let self = self else {
                return
            }
            self.gyms = allGyms
            self.presenter?.displayGyms()
        }
    }
    
    func numberOfGyms() -> Int {
        return gyms?.count ?? 0
    }
    
    func gymAtRow(_ row: Int) -> GymListCellViewModel?  {
        guard let gym = gyms else {
            return nil
        }
        if gym.indices.contains(row) {
            let eachGym = gym[row]
            let cellModel = GymListCellViewModel(name: eachGym.name, address: eachGym.address)
            return cellModel
        }
        return nil
    }
}
