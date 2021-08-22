//
//  FoundationExtensions.swift
//  TaskCountDownUIKit
//
//  Created by Thor on 22/08/2021.
//

import Foundation
import UIKit

extension Int{
    func appendZeros() -> String {
        if (self < 10) {
            return "0\(self)"
        } else {
            return "\(self)"
        }
    }
    
    func degreeToRadians() -> CGFloat {
       return  (CGFloat(self) * .pi) / 180
    }
}

extension Double{
    func degreeToRadians() -> CGFloat {
       return  (CGFloat(self) * .pi) / 180
    }
}
