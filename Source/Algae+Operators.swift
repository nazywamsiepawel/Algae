//
//  Algae+Operations.swift
//  NeuroSwift
//
//  Created by Pawel Borkowski on 08/12/2015.
//  Copyright © 2015 Pawel Borkowski. All rights reserved.
//

import Foundation

public prefix func - (v: Vector) -> Vector {
    return Algae.neg(v)
}

public prefix func - (m:Matrix) -> Matrix {
    return Algae.neg(m)
}

public func + (lhs: Vector, rhs: Vector) -> Vector{
    return Algae.add(lhs, rhs)
}

public func - (lhs: Vector, rhs: Vector) -> Vector {
    return Algae.sub(lhs, rhs)
}

public func + (lhs: Matrix, rhs: Matrix) -> Matrix {
    return Algae.add(lhs, rhs)
}
public func - (lhs: Matrix, rhs: Matrix) -> Matrix {
    return Algae.sub(lhs, rhs)
}

public func + (lhs: Vector, rhs: Double) -> Vector {
    return Algae.add(lhs, rhs)
}

public func - (lhs: Vector, rhs: Double) -> Vector {
    return Algae.sub(lhs, rhs)
}

public func + (lhs: Matrix, rhs: Double) -> Matrix {
    return Algae.add(lhs, rhs)
}

public func - (lhs: Matrix, rhs: Double) -> Matrix {
    return Algae.sub(lhs, rhs)
}

public func * (lhs: Matrix, rhs: Double) -> Matrix {
    return Algae.mul(lhs, rhs)
}

public func * (lhs: Vector, rhs: Double) -> Vector {
    return Algae.mul(lhs, rhs)
}
public func * (lhs: Vector, rhs: Vector) -> Vector {
    return Algae.mul(lhs, rhs)
}

public func * (lhs: Matrix, rhs: Matrix) -> Matrix {
    return Algae.mm(lhs, rhs)
}

public func * (lhs: Matrix, rhs: Vector) -> Vector {
    return Algae.mv(lhs, rhs)
}

public func / (lhs: Matrix, rhs: Double) -> Matrix {
    return Algae.div(lhs, rhs)
}

public func / (lhs: Vector, rhs: Double) -> Vector {
    return Algae.div(lhs, rhs)
}

infix operator ** { associativity left precedence 160 }

public func ** (left: Double, right: Double) -> Double {
    return pow(left, right)
}



