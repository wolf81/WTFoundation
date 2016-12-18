//
//  UIImageExtensions.swift
//  WTFoundation
//
//  Created by Wolfgang Schreurs on 18/12/2016.
//  Copyright © 2016 Wolftrail. All rights reserved.
//

import UIKit
import CoreGraphics

extension UIImage {
    public static func wt_fromColor(_ color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)

        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image!
    }
}

