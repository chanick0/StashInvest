//
//  UIView+outline.swift
//  StashCoach
//
//  Created by Chanick on 1/12/21.
//  Copyright © 2020 Chanick Park. All rights reserved.
//

import UIKit

extension UIView {

    // MARK: - outline, shadow

    // outline
    func outline(bgColor: UIColor, borderColor: UIColor, border: CGFloat = 1, radius: CGFloat = 2) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = border
        self.backgroundColor = bgColor
    }

    func outlineCircle(bgColor: UIColor, borderColor: UIColor, border: CGFloat = 1) {
        outline(bgColor: bgColor, borderColor: borderColor, border: border, radius: self.frame.height / 2)
    }

    func shadow(_ color: UIColor = .black, radius: CGFloat = 3.0, shadowRadius: CGFloat = 3.0, opacity: CGFloat = 0.3, offset: CGSize = CGSize(width: 0, height: 2)) {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = radius
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = Float(opacity)
        self.layer.shadowOffset = offset
    }
}
