//
//  MLP.swift
//  MLP
//
//  Created by Pawel Borkowski on 22/05/2016.
//  Copyright © 2016 Pawel Borkowski. All rights reserved.
//

import UIKit

let X = Matrix(rows: 3, cols: 2, storage: [3, 5, 5, 1, 10, 2])
let Y = Matrix(rows: 3, cols: 1, storage: [75, 82, 93])

class MLP {
    let inputLayerSize = 2
    let hiddenLayerSize = 3
    let outputLayerSize = 1
    
    let W1:Matrix
    let W2:Matrix
    
    
    var z2:Matrix
    var z3:Matrix
    
    var delta2:Matrix
    var delta3:Matrix
    
    var dJdW2:Matrix
    var dJdW1:Matrix
    
    var a2:Matrix
    
    var yHat:Matrix
    
    
    init(){
        /* Normalize vals */
        X.normalizeColumns()
        Y.normalize(toValue: 100)
        
        /* Prepare data storage */
        let batchSize = 3
        W1 = Matrix(rows: inputLayerSize, cols: hiddenLayerSize)
        W2 = Matrix(rows: hiddenLayerSize, cols: outputLayerSize)

        z2 = Matrix(rows: batchSize, cols: hiddenLayerSize)
        z3 = Matrix(rows: 3, cols: 1)
        
        delta2 = Matrix(rows: 3, cols: 1)
        delta3 = Matrix(rows: 3, cols: 1)
        dJdW2 = Matrix(rows: 3, cols: 1)
        dJdW1 = Matrix(rows: 3, cols: 1)
        
        a2 = Matrix(rows: batchSize, cols: hiddenLayerSize)
        yHat = Matrix(rows: 3, cols: 1)
        
        W1.fillRandom(0.0, max: 1.0)
        W2.fillRandom(0.0, max: 1.0)

        yHat.zero()
    }
    
    func forward(input:Matrix) -> Matrix {
        z2 = input * W1
        a2 = Algae.sigmoid(z2)
        z3 = a2 * W2
        return Algae.sigmoid(z3)
    }
    
    func cost() -> Double {
        self.yHat = forward(X)
        let diff = (Y - yHat).getCol(0)
        return (0.5 * Algae.sum(diff)) ** 2
        
    }
    
    func costPrime(X:Matrix, y:Matrix){
        self.yHat = forward(X)
        delta3 = Algae.mm(-(y-self.yHat), Algae.sigmoidPrime(z2))
        dJdW2 = Algae.mm(a2.t(), delta3)
        print("")
//        #Compute derivative with respect to W and W2 for a given X and y:
//        self.yHat = self.forward(X)
//        
//        delta3 = np.multiply(-(y-self.yHat), self.sigmoidPrime(self.z3))
//        dJdW2 = np.dot(self.a2.T, delta3)
//        
//        delta2 = np.dot(delta3, self.W2.T)*self.sigmoidPrime(self.z2)
//        dJdW1 = np.dot(X.T, delta2)
//        
//        return dJdW1, dJdW2
        

       
    }
}
