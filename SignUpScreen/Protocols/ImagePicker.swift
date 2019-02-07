//
//  ImagePicker.swift
//  Tribe
//
//  Created by Vahagn Gevorgyan on 13/10/2018.
//  Copyright © 2018 Vahagn Gevorgyan. All rights reserved.
//

import UIKit

protocol ImagePicker: class, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
}

extension ImagePicker where Self: UIViewController {
    

    private func openImagePicker(type: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = type
        if type == .camera {
            imagePicker.cameraDevice = .front
        }
        present(imagePicker, animated: true, completion: nil)
    }
    
    func openImagePicker(type: UIImagePickerController.SourceType? = nil) {
        if let type = type {
            openImagePicker(type: type)
            return
        }
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Take Photo", style: .default) { _ in
            self.openImagePicker(type: .camera)
        }
        let photoAction = UIAlertAction(title: "Choose Photo", style: .default) { _ in
            self.openImagePicker(type: .photoLibrary)
        }
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
        sheet.addAction(cameraAction)
        sheet.addAction(photoAction)
        sheet.addAction(cancelAction)
        present(sheet, animated: true, completion: nil)
    }
}
