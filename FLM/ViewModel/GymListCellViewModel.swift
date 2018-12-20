//
//  GymListCellViewModel.swift
//  FLM
//
//  Created by Sunil Kumar on 20/12/18.
//  Copyright © 2018 Sunil Kumar. All rights reserved.
//

import Foundation

struct GymListCellViewModel {
    
    var name: String
    
    var address: String
    
    init(name: String, address: String) {
        self.name = name
        self.address = address
    }
}
