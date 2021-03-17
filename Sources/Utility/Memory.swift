//
//  Memory.swift
//  Kingfisher
//
//  Created by jingpengbo on 2021/3/15.
//
//  Copyright (c) 2021 Wei Wang <onevcat@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation
import UIKit


internal class Memory {
    internal static func memoryUsage() -> NSInteger {
        var taskInfo = task_vm_info_data_t()
        var count = mach_msg_type_number_t(MemoryLayout<task_vm_info>.size / MemoryLayout<natural_t>.size)
        let result: kern_return_t = withUnsafeMutablePointer(to: &taskInfo) {
            $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
                task_info(mach_task_self_, task_flavor_t(TASK_VM_INFO), $0, &count)
            }
        }
        
        var used: NSInteger = 0
        if result == KERN_SUCCESS {
            used = NSInteger(taskInfo.phys_footprint)
        }
        
        return used
    }
    
    internal static func physicalMemorySize() -> NSInteger {
        return NSInteger(ProcessInfo.processInfo.physicalMemory)
    }
    
    internal static func memoryTotoalAvailable() -> CGFloat {
        let unTestDeviceModel: CGFloat = 0.5
        var memoryTotoalAvailablePer = unTestDeviceModel
        switch UIDevice.current.modelName {
        case .iPod_Touch_5 :
            memoryTotoalAvailablePer = 0.56
        case .iPod_Touch_6 :
            memoryTotoalAvailablePer = unTestDeviceModel
        case .iPhone_4 :
            memoryTotoalAvailablePer = 0.63
        case .iPhone_4s :
            memoryTotoalAvailablePer = 0.56
        case .iPhone_5 :
            memoryTotoalAvailablePer = 0.62
        case .iPhone_5c :
            memoryTotoalAvailablePer = unTestDeviceModel
        case .iPhone_5s :
            memoryTotoalAvailablePer = 0.63
        case .iPhone_6 :
            memoryTotoalAvailablePer = 0.62
        case .iPhone_6_Plus :
            memoryTotoalAvailablePer = 0.62
        case .iPhone_6s :
            memoryTotoalAvailablePer = 0.68
        case .iPhone_6s_Plus :
            memoryTotoalAvailablePer = 0.68
        case .iPhone_SE :
            memoryTotoalAvailablePer = 0.69
        case .iPhone_7 :
            memoryTotoalAvailablePer = 0.68
        case .iPhone_7_Plus :
            memoryTotoalAvailablePer = 0.66
        case .iPhone_8 :
            memoryTotoalAvailablePer = 0.70
        case .iPhone_8_Plus :
            memoryTotoalAvailablePer = unTestDeviceModel
        case .iPhone_X :
            memoryTotoalAvailablePer = 0.5
        case .iPhone_Xr :
            memoryTotoalAvailablePer = 0.63
        case .iPhone_Xs :
            memoryTotoalAvailablePer = 0.54
        case .iPhone_Xs_Max :
            memoryTotoalAvailablePer = 0.55
        case .iPhone_11 :
            memoryTotoalAvailablePer = 0.54
        case .iPhone_11_Pro :
            memoryTotoalAvailablePer = unTestDeviceModel
        case .iPhone_11_Pro_Max :
            memoryTotoalAvailablePer = 0.55
        case .iPhone_SE_2nd_Gen :
            memoryTotoalAvailablePer = unTestDeviceModel
        case .iPhone_12_Mini :
            memoryTotoalAvailablePer = unTestDeviceModel
        case .iPhone_12 :
            memoryTotoalAvailablePer = unTestDeviceModel
        case .iPhone_12_Pro :
            memoryTotoalAvailablePer = unTestDeviceModel
        case .iPhone_12_Pro_Max :
            memoryTotoalAvailablePer = unTestDeviceModel
        case .iPad :
            memoryTotoalAvailablePer = 0.49
        case .iPad_2 :
            memoryTotoalAvailablePer = 0.53
        case .iPad_3 :
            memoryTotoalAvailablePer = 0.62
        case .iPad_4 :
            memoryTotoalAvailablePer = 0.57
        case .iPad_Air :
            memoryTotoalAvailablePer = 0.68
        case .iPad_Air_2 :
            memoryTotoalAvailablePer = 0.68
        case .iPad_Mini :
            memoryTotoalAvailablePer = 0.58
        case .iPad_Mini_2 :
            memoryTotoalAvailablePer = 0.68
        case .iPad_Mini_3 :
            memoryTotoalAvailablePer = unTestDeviceModel
        case .iPad_Mini_4 :
            memoryTotoalAvailablePer = unTestDeviceModel
        case .iPad_Pro_9_7 :
            memoryTotoalAvailablePer = 0.71
        case .iPad_Pro_12_9 :
            memoryTotoalAvailablePer = 0.76
        case .iPad_5 :
            memoryTotoalAvailablePer = unTestDeviceModel
        case .iPad_6 :
            memoryTotoalAvailablePer = unTestDeviceModel
        case .iPad_7 :
            memoryTotoalAvailablePer = unTestDeviceModel
        case .Apple_TV :
            memoryTotoalAvailablePer = unTestDeviceModel
        case .Simulator :
            memoryTotoalAvailablePer = 1
        case .unknwon(_) :
            memoryTotoalAvailablePer = unTestDeviceModel
        }
        return memoryTotoalAvailablePer * CGFloat(physicalMemorySize())
    }
}
