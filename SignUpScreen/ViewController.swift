//
//  ViewController.swift
//  SignUpScreen
//
//  Created by Vahgan Gevorgyan on 2/6/19.
//  Copyright © 2019 Vahgan Gevorgyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, KeyboardHandler {
    
    @IBOutlet weak var profileButton: DesignableButton!
    @IBOutlet weak var scrollView: UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyboardObservers()
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func profileButtonPressed() {
        openImagePicker()
    }
    
    @IBAction func signUpButtonPressed() {
        alert(title: "Successfully Logged In")
    }
    
}

extension ViewController: ImagePicker {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        if let image = info[.originalImage] as? UIImage {
            profileButton.setImage(image, for: .normal)
        }
    }
}
