//
//  DesignableButton.swift
//  SignUpScreen
//
//  Created by Vahgan Gevorgyan on 2/8/19.
//  Copyright © 2019 Vahgan Gevorgyan. All rights reserved.
//

import UIKit

@IBDesignable class DesignableButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            configure()
        }
    }
    
    @IBInspectable var shadowRadious: CGFloat = 0 {
        didSet {
            configure()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            configure()
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.gray {
        didSet {
            configure()
        }
    }
    
    required init?(coder aDecoder:NSCoder) {
        super.init(coder:aDecoder)
        configure()
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        configure()
    }
}

// MARK: - Supporting function
extension DesignableButton {
    func configure() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowRadius = shadowRadious
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize.zero
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}
