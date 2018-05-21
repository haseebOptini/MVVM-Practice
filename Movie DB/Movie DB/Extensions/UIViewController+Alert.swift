//
//  UIViewController+Alert.swift
//  MyTaxiTest
//
//  Created by Abdul Haseeb on 8/12/17.
//  Copyright © 2017 Abdul Haseeb. All rights reserved.
//

import UIKit

extension UIViewController {
    /**
     This method is used to show alert view with ok button
     
     - Parameter title: used to show alert view title
     - Parameter message: Show alert view message
     */
    
    func showOKAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
