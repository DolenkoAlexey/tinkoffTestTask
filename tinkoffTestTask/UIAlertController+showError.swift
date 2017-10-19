//
//  UIAlertController+showError.swift
//  tinkoffTestTask
//
//  Created by Alex Dolenko on 18/10/2017.
//  Copyright © 2017 Alex Dolenko. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    static func showErrorAlert(_ error: String, context: UIViewController?) {
        let alert = UIAlertController(title: "Oops", message: error, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel",style: .cancel))
        context?.present(alert, animated: true)
    }
}
