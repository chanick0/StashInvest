//
//  Array+extension.swift
//  StashCoach
//
//  Created by Chanick Park on 1/12/21.
//  Copyright © 2020 Chanick Park. All rights reserved.
//

import Foundation

extension Array {
    // MARK: - subscript

    subscript (safe index: Index) -> Element? {
        return (index >= 0 && index < count) ? self[index] : nil
    }
}
