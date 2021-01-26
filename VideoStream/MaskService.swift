//
//  MaskService.swift
//  VideoStream
//
//  Created by Arthur BLANC on 26/01/2021.
//  Copyright © 2021 Arthur BLANC. All rights reserved.
//

import Foundation

protocol MaskService {
    
    func screen(completion: @escaping (Int) -> Void)
    func stat(completion: @escaping (Mask) -> Void)

}
