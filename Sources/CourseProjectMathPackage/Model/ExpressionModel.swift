//
//  ExpressionModel.swift
//  CourseProject2.0Math
//
//  Created by Anastasia on 29.04.2022.
//

import UIKit

public struct ExpressionModel {
    public var leftNumberRange: Range<Double>
    public var rightNumberRange: Range<Double>
    
    public init(leftNumberRange: Range<Double>, rightNumberRange: Range<Double>) {
        self.leftNumberRange = leftNumberRange
        self.rightNumberRange = rightNumberRange
    }
}
