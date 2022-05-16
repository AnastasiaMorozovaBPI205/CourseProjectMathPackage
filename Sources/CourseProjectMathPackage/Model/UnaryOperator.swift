//
//  UnaryOperator.swift
//  CourseProject2.0Math
//
//  Created by Anastasia on 29.04.2022.
//

import UIKit

public enum UnaryOperator {
    case sqrt
    case sin
    case cos
    case tan
    case factorial
    case none
    
    static func random() -> UnaryOperator {
        switch Int.random(in: 0...5) {
        case 0:
            return .sqrt
        case 1:
            return .sin
        case 2:
            return .cos
        case 3:
            return .tan
        case 4:
            return .factorial
        case 5:
            return .none
        default:
            return .none
        }
    }
}
