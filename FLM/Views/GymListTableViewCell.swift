//
//  GymListTableViewCell.swift
//  FLM
//
//  Created by Sunil Kumar on 20/12/18.
//  Copyright © 2018 Sunil Kumar. All rights reserved.
//

import UIKit

class GymListTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(model: GymListCellViewModel) {
        self.textLabel?.text = model.name
        self.detailTextLabel?.text = model.address
    }

}
