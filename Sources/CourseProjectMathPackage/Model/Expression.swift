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
    private var leftNumber: Int = 0
    private var rightNumber: Int = 0
    
    private var leftUnaryOperator: UnaryOperator?
    private var rightUnaryOperator: UnaryOperator?
    
    public init(_ model: ExpressionModel) {
        self.model = model
        
        randomize()
        result = calculateExpression()
    }
    
    private func randomize() {
        guard let model = model else { return }
        
        repeat {
            operator_ = BinaryOperator.random()
            
            rightNumber = Int.random(in: model.rightNumberRange)
            leftNumber = Int.random(in: model.leftNumberRange)
            
            leftUnaryOperator = UnaryOperator.random()
            rightUnaryOperator = UnaryOperator.random()
        } while (
            operator_ == .division && rightNumber == 0
                || checkNumber(number: leftNumber, operator_: leftUnaryOperator)
                || checkNumber(number: rightNumber, operator_: rightUnaryOperator)
                || floor(calculateExpression()) != calculateExpression()
                || calculateExpression() > Double(Int.max)
        )
    }
    
    private func checkNumber(number: Int, operator_: UnaryOperator?) -> Bool {
        return operator_ == .sqrt && (number < 0 || floor(sqrt(Double(number))) != sqrt(Double(number)))
            || operator_ == .factorial && number >= 13
            || operator_ == .cos && (floor(cos(Double(number))) != cos(Double(number)))
            || operator_ == .sin && (floor(sin(Double(number))) != sin(Double(number)))
            || operator_ == .tan && (floor(tan(Double(number))) != tan(Double(number)))
    }
    
    private func calculateExpression() -> Double {
        guard let leftUnaryOperator = leftUnaryOperator else { return 0 }
        guard let rightUnaryOperator = rightUnaryOperator else { return 0 }
        
        let leftPart = calculateUnaryExpression(operator_: leftUnaryOperator, number: leftNumber)
        let rightPart = calculateUnaryExpression(operator_: rightUnaryOperator, number: rightNumber)
        
        switch operator_ {
        case .plus:
            return leftPart + rightPart
        case .minus:
            return leftPart - rightPart
        case .multiplication:
            return leftPart * rightPart
        case .division:
            return leftPart / rightPart
        case .exponentiation:
            return pow(leftPart, rightPart)
        case .none:
            return 0
        }
    }
    
    private func calculateUnaryExpression(operator_: UnaryOperator, number: Int) -> Double {
        switch operator_ {
        case .sqrt:
            return sqrt(Double(number))
        case .sin:
            return sin(Double(number))
        case .cos:
            return cos(Double(number))
        case .tan:
            return tan(Double(number))
        case .factorial:
            return Double(calculateFactorial(number: number))
        case .none:
            return Double(number)
        }
    }
    
    private func calculateFactorial(number: Int) -> Int {
        if (number == 0) {
            return 0
        }
        
        var product = 1
        for _ in 1...number {
            product *= number
        }
        
        return product
    }
    
    private func getUnaryExpression(operator_: UnaryOperator, number: Int) -> String {
        switch operator_ {
        case .sqrt:
            return "sqrt(\(number))"
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
            number: leftNumber
        )
        + getBinaryOperator()
        + getUnaryExpression(
            operator_: rightUnaryOperator,
            number: rightNumber
        )
    }
    
    public func getResult() -> Int {
        return Int(result)
    }
}
