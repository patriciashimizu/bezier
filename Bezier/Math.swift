func binaryOperation(num1: Double, num2: Double, symbol: String) -> Double {
    switch symbol {
    case "+":
        return num1 + num2
    default:
        break
    }
    return 0.0
}
//========================================
import Foundation
//========================================
class Math {
    //------------------------------------
    enum Operation {
        case constant(Double) //π
        case unary((Double) -> Double) //√
        case binary((Double, Double, String) -> Double) //+-*/
        case random((UInt32) -> UInt32)
    }
    //------------------------------------
    var operations: [String : Operation] = [
        "π" : Operation.constant(Double.pi),
        "√" : Operation.unary(sqrt),
        "+" : Operation.binary(binaryOperation),
        "cos" : Operation.unary(__cospi),
        "sin" : Operation.unary(__sinpi),
        "rand" : Operation.random(arc4random_uniform)
    ]
    //------------------------------------
    func returnValue(_ symbol: String, _ values: [Double]) -> Double {
        if let op = operations[symbol] {
            switch op {
                case .constant(let value):
                    return value
                case .unary(let function):
                    return function(values[0])
                case .binary(let function):
                    return function(values[0], values[1], symbol)
                case .random(let function):
                    let i: Int = Int(function(UInt32(values[0])))
                    let d: Double = Double(i)
                    return d
            }
        }
        return 0.0
    }
    //------------------------------------
    //------------------------------------
}
//========================================
