//
//  UIColor+random.swift
//  StashCoach
//
//  Created by Chanick Park on 1/12/21.
//  Copyright © 2020 Chanick Park. All rights reserved.
//

import UIKit

extension UIColor {
    // random color
    static var random: UIColor {
        let randomRed: CGFloat = CGFloat(drand48())
        let randomGreen: CGFloat = CGFloat(drand48())
        let randomBlue: CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
}

extension UIColor {
    // generate image with color
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
