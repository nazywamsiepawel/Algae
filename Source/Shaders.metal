//
//  Shaders.metal
//  MetalTest
//
//  Created by Pawel Borkowski on 19/03/2016.
//  Copyright © 2016 Pawel Borkowski. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

kernel void sigmoid(device float *x [[ buffer(0) ]],
                    device float *y [[ buffer(1) ]],
                    uint id [[ thread_position_in_grid ]])
{
    y[id] = 1.0 / (1.0 + exp(-x[id]));
}

kernel void neg(device float *x [[buffer(0)]],
                device float *y [[buffer(1)]],
                uint id [[thread_position_in_grid]])
{
    y[id] = -x[id];
}