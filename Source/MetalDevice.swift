//
//  MetalDevice.swift
//  MetalTest
//
//  Created by Pawel Borkowski on 19/03/2016.
//  Copyright © 2016 Pawel Borkowski. All rights reserved.
//

import Foundation
import Metal


class MetalDevice {
    private var device: MTLDevice
    private var commandQueue: MTLCommandQueue
    private var pipelineState: MTLComputePipelineState!
    private var commandBuffer: MTLCommandBuffer!
    private var library: MTLLibrary!
    
    init() {
        device = MTLCreateSystemDefaultDevice()!
        commandQueue = device.newCommandQueue()
        pipelineState = nil
        library = device.newDefaultLibrary()!
    }
    
    private func nearestPower2(num: Int) -> Int {
        var n: Int = num > 0 ? num - 1 : 0;
        
        n |= n >> 1
        n |= n >> 2
        n |= n >> 4
        n |= n >> 8
        n |= n >> 16
        n += 1
        
        return n
    }
    
    func sigmoid(v:Vector) -> [Float]{
        return _elemWiseOperation("sigmoid", storage: v)
    }
    
    func neg(v:Vector) -> [Float]{
        return _elemWiseOperation("neg", storage: v)
    }

    
    func _elemWiseOperation(shaderName:String, storage:DataStorage) -> [Float] {
        let function = library.newFunctionWithName(shaderName)
        var threadGroupSize: MTLSize
        var threadGroups: MTLSize
        var output = [Float](count: storage.storage.count, repeatedValue: 0.0)
        commandBuffer = commandQueue.commandBuffer()
        
        do {
            pipelineState = try device.newComputePipelineStateWithFunction(function!)
        } catch {
            print("Caught error when trying to create computePipelineState!")
        }
        
        let inputBuffer = device.newBufferWithBytes(storage.storage, length: storage.storage.count * sizeof(Float), options:
            MTLResourceOptions.CPUCacheModeDefaultCache)
        let outputBuffer = device.newBufferWithLength(storage.storage.count * sizeof(Float), options:
            MTLResourceOptions.CPUCacheModeDefaultCache)
        
        let commandEncoder = commandBuffer.computeCommandEncoder()
        commandEncoder.setBuffer(inputBuffer, offset: 0, atIndex: 0)
        commandEncoder.setBuffer(outputBuffer, offset: 0, atIndex: 1)
        commandEncoder.setComputePipelineState(pipelineState!)
        
        threadGroupSize = MTLSizeMake(128, 1, 1)
        threadGroups = MTLSizeMake(0, 1, 1)
        
        let pow = Int(nearestPower2(storage.storage.count))
        threadGroups.width = pow
        
        commandEncoder.dispatchThreadgroups(threadGroups, threadsPerThreadgroup: threadGroupSize)
        commandEncoder.endEncoding()
        
        commandBuffer.commit()
        commandBuffer.waitUntilCompleted()
        
        let data = NSData(bytesNoCopy: outputBuffer.contents(), length: storage.storage.count * sizeof(Float),
            freeWhenDone: false)
        data.getBytes(&output, length: storage.storage.count * sizeof(Float))
        
        return output
    }
}
