//
//  UIViewControllerExtension.swift
//  Tribe
//
//  Created by Vahagn Gevorgyan on 13/10/2018.
//  Copyright © 2018 Vahagn Gevorgyan. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func alert(title: String, message: String? = nil, action: (() -> ())? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            action?()
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }

}
