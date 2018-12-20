//
//  GymService.swift
//  FLM
//
//  Created by Sunil Kumar on 20/12/18.
//  Copyright © 2018 Sunil Kumar. All rights reserved.
//

import Foundation
import Alamofire
import CoreLocation
import SwiftyJSON

enum GymProperties: String {
    case name
    case address
    case latitude
    case longitude
}

struct GymService: GymServiceProtocol {
    
    let APIurl = "https://private-anon-654b6944ee-fitlgdemo.apiary-mock.com/api/v1/gyms"
    
    func fetchGyms(location: CLLocationCoordinate2D ,completion:@escaping ([Gym]?) -> ()) {
        
        let parameters: Parameters = [GymProperties.latitude.rawValue : location.latitude, GymProperties.longitude.rawValue : location.longitude]
        Alamofire.request(APIurl, method: .post, parameters: parameters).responseJSON { response in
            debugPrint(response)
            var gyms: [Gym] = []
            
            guard let jsonValue = response.result.value else {
                return completion(nil)
            }
            
            let json: JSON = JSON(jsonValue)
            
            for (_, value) in json {
                let name = value[GymProperties.name.rawValue].stringValue
                let address = value[GymProperties.address.rawValue].stringValue
                let gym = Gym(name: name, address: address)
                gyms.append(gym)
            }
            return completion(gyms)
        }
    }
}
