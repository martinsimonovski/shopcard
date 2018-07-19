//
//  ViewControllerExtension.swift
//  ShopCard
//
//  Created by Martin Simonovski on 7/18/18.
//  Copyright © 2018 Martin Simonovski. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
