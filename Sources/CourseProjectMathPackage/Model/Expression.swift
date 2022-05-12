//
//  MathExpressionsRandomizer.swift
//  CourseProject2.0Math
//
//  Created by Anastasia on 29.04.2022.
//

import UIKit

public final class Expression {
    private var result: Double = 0
    private var model: ExpressionModel?
    
    private var operator_: BinaryOperator?
    private var leftNumber: Double = 0
    private var rightNumber: Double = 0
    
    private var leftUnaryOperator: UnaryOperator?
    private var rightUnaryOperator: UnaryOperator?
    
    public init(_ model: ExpressionModel) {
        self.model = model
        
        randomize()
        calculateExpression()
    }
    
    private func randomize() {
        guard let model = model else { return }
        
        repeat {
            operator_ = BinaryOperator.random()
            
            rightNumber = Double.random(in: model.rightNumberRange)
            leftNumber = Double.random(in: model.leftNumberRange)
            
            leftUnaryOperator = UnaryOperator.random()
            rightUnaryOperator = UnaryOperator.random()
        } while (
            operator_ == .division && rightNumber == 0
                || leftUnaryOperator == .sqrt && leftNumber < 0
                || rightUnaryOperator == .sqrt && rightNumber < 0
                || leftUnaryOperator == .log && leftNumber <= 0
                || rightUnaryOperator == .log && rightNumber <= 0
                || leftUnaryOperator == .factorial && leftNumber >= 13
                || rightUnaryOperator == .factorial && rightNumber >= 13
        )
    }
    
    private func calculateExpression() {
        guard let leftUnaryOperator = leftUnaryOperator else { return }
        guard let rightUnaryOperator = rightUnaryOperator else { return }
        
        let leftPart = calculateUnaryExpression(operator_: leftUnaryOperator, number: leftNumber)
        let rightPart = calculateUnaryExpression(operator_: rightUnaryOperator, number: rightNumber)
        
        switch operator_ {
        case .plus:
            result = leftPart + rightPart
        case .minus:
            result = leftPart - rightPart
        case .multiplication:
            result = leftPart * rightPart
        case .division:
            result = leftPart / rightPart
        case .percentage:
            result = leftPart.truncatingRemainder(dividingBy: rightNumber)
        case .exponentiation:
            result = pow(leftPart, rightPart)
        case .none:
            result = 0
        }
    }
    
    private func calculateUnaryExpression(operator_: UnaryOperator, number: Double) -> Double {
        switch operator_ {
        case .sqrt:
            return sqrt(number)
        case .abs:
            return abs(number)
        case .log:
            return log(number)
        case .sin:
            return sin(number)
        case .cos:
            return cos(number)
        case .tan:
            return tan(number)
        case .factorial:
            return Double(calculateFactorial(number: number))
        case .none:
            return number
        }
    }
    
    private func calculateFactorial(number: Double) -> Int {
        let value = Int(round(number))
        
        var product = 1
        for _ in 1...value {
            product *= value
        }
        
        return product
    }
    
    private func getUnaryExpression(operator_: UnaryOperator, number: Double) -> String {
        switch operator_ {
        case .sqrt:
            return "sqrt(\(number))"
        case .abs:
            return "abs(\(number))"
        case .log:
            return "log(\(number))"
        case .sin:
            return "sin(\(number))"
        case .cos:
            return "cos(\(number))"
        case .tan:
            return "tan(\(number))"
        case .factorial:
            return "\(number)!"
        case .none:
            return "\(number)"
        }
    }
    
    private func getBinaryOperator() -> String {
        switch operator_ {
        case .plus:
            return " + "
        case .minus:
            return " - "
        case .multiplication:
            return " * "
        case .division:
            return " / "
        case .percentage:
            return " % "
        case .exponentiation:
            return " ^ "
        case .none:
            return ""
        }
    }
    
    public func getExpression() -> String {
        guard let leftUnaryOperator = leftUnaryOperator else { return "" }
        guard let rightUnaryOperator = rightUnaryOperator else { return "" }
        
        return getUnaryExpression(
            operator_: leftUnaryOperator,
            number: round(1000 * leftNumber) / 1000
        )
        + getBinaryOperator()
        + getUnaryExpression(
            operator_: rightUnaryOperator,
            number: round(1000 * rightNumber) / 1000
        )
    }
    
    public func getResult() -> Double {
        return result
    }
}
