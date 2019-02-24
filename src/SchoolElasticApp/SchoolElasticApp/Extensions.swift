//
//  Extensions.swift
//  SchoolElasticApp
//
//  Created by haktan enes biçer on 30.12.2018.
//  Copyright © 2018 haktan enes biçer. All rights reserved.
//

import Foundation

extension String {
    func toDouble() -> Double? {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US_POSIX")
        return numberFormatter.number(from: self)?.doubleValue
    }
}
