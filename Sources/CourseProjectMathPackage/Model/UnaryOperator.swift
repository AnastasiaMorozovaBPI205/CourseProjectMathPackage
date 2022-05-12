//
//  UnaryOperator.swift
//  CourseProject2.0Math
//
//  Created by Anastasia on 29.04.2022.
//

import UIKit

public enum UnaryOperator {
    case sqrt
    case abs
    case log
    case sin
    case cos
    case tan
    case factorial
    case none
    
    static func random() -> UnaryOperator {
        switch Int.random(in: 0...8) {
        case 0:
            return .sqrt
        case 1:
            return .abs
        case 2:
            return .log
        case 3:
            return .sin
        case 4:
            return .cos
        case 5:
            return .tan
        case 6:
            return .factorial
        case 7:
            return .none
        default:
            return .none
        }
    }
}
