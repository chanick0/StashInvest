//
//  UIStoryboard+extension.swift
//  StashCoach
//
//  Created by Chanick Park on 1/12/21.
//  Copyright © 2020 Chanick Park. All rights reserved.
//

import UIKit

extension UIStoryboard {

    func instantiateViewController<T: UIViewController>(ofType _: T.Type, withIdentifier identifier: String? = nil) -> T {
        let identifier = identifier ?? String(describing: T.self)
        return instantiateViewController(withIdentifier: identifier) as! T
    }

}
