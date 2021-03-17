//
//  MockNavigationController.swift
//  MeditApptionTests
//
//  Created by Talip Böke on 13.03.2021.
//

import UIKit

internal final class MockNavigationController: UINavigationController {

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: false)
    }
}
