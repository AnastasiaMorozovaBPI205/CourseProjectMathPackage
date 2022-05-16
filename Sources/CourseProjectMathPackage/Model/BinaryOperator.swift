//
//  Operator.swift
//  CourseProject2.0Math
//
//  Created by Anastasia on 29.04.2022.
//

import UIKit

public enum BinaryOperator {
    case plus
    case minus
    case multiplication
    case division
    case exponentiation
    
    static func random() -> BinaryOperator {
        switch Int.random(in: 0...4) {
        case 0:
            return .plus
        case 1:
            return .minus
        case 2:
            return .multiplication
        case 3:
            return division
        case 4:
            return exponentiation
        default:
            return .plus
        }
    }
}
