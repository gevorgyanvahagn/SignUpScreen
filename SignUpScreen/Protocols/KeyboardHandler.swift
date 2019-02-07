//
//  KeyboardHandler.swift
//  SignUpScreen
//
//  Created by Vahgan Gevorgyan on 2/8/19.
//  Copyright © 2019 Vahgan Gevorgyan. All rights reserved.
//

import UIKit

protocol KeyboardHandler {
    var scrollView: UIScrollView? { get }
    func addKeyboardObservers()
}

extension KeyboardHandler {
    
    func addKeyboardObservers() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (notification) in
            self.keyboardWillShow(notification: notification)
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (notification) in
            self.keyboardWillHide(notification: notification)
        }
    }
    
    private func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let contentInset = keyboardFrame.cgRectValue.height + 50
        if scrollView?.contentInset.bottom == 0 {
            scrollView?.contentInset.bottom += contentInset
            scrollView?.scrollIndicatorInsets.bottom += contentInset
        }
    }
    
    private func keyboardWillHide(notification: Notification) {
        scrollView?.contentInset = UIEdgeInsets.zero
    }
}
