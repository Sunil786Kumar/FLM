//
//  GymListViewModelSpec.swift
//  FLMTests
//
//  Created by Sunil Kumar on 20/12/18.
//  Copyright © 2018 Sunil Kumar. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import FLM

class GymListViewModelSpec: QuickSpec {

    override func spec() {
        let service = GymService()
        
        let viewModel = GymListViewModel(service: service, present: nil)
        
        describe("GymListViewControllerSpec") {
            beforeEach {
                viewModel.gyms = [Gym(name: "Gym1", address: "Sydney"),Gym(name: "Gym2", address: "Bondi"), Gym(name: "Gym2", address: "Glebe")]
            }
            context("when view is loaded") {
                it("should have 3 gyms loaded") {
                    expect(viewModel.numberOfGyms()).to(equal(3))
                }
            }
        }
        
        describe("GymListViewControllerSpec") {
            beforeEach {
                viewModel.gyms = [Gym(name: "Gym1", address: "Sydney"),Gym(name: "Gym2", address: "Bondi"), Gym(name: "Gym2", address: "Glebe")]
            }
            context("cell should have a gym") {
                it("should display gym at current row") {
                    let model = viewModel.gymAtRow(0)
                    expect(model?.name).to(equal("Gym1"))
                    expect(model?.address).to(equal("Sydney"))
                }
            }
        }
    }
}
