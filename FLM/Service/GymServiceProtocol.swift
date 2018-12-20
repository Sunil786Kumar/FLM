//
//  GymServiceProtocol.swift
//  FLM
//
//  Created by Sunil Kumar on 20/12/18.
//  Copyright © 2018 Sunil Kumar. All rights reserved.
//

import Foundation
import CoreLocation

protocol GymServiceProtocol {
    
    func fetchGyms(location: CLLocationCoordinate2D, completion:@escaping ([Gym]?) -> ())
    
}
