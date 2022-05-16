//
//  ExpressionModel.swift
//  CourseProject2.0Math
//
//  Created by Anastasia on 29.04.2022.
//

import UIKit

public struct ExpressionModel {
    public var leftNumberRange: Range<Int>
    public var rightNumberRange: Range<Int>
    
    public init(leftNumberRange: Range<Int>, rightNumberRange: Range<Int>) {
        self.leftNumberRange = leftNumberRange
        self.rightNumberRange = rightNumberRange
    }
}
