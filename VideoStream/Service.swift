//
//  SpaceshipAPIService.swift
//  StarFighter
//
//  Created by Benjamin Rousval on 01/02/2020.
//  Copyright © 2020 StarFighter. All rights reserved.
//

import Foundation
import Alamofire


class Service: MaskService {
    
    private let headers: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    
    func screen(completion: @escaping (Int) -> Void) {
        AF.request("http://192.168.1.97:5000/", method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON{ response in
            
            guard let json_response = response.value as? Int else {
                                   return
                               }
            
            print(json_response)
            completion(json_response)
        }
    }
    func stat(completion: @escaping (Mask) -> Void) {
        AF.request("http://192.168.1.97:5000/stat", method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON{ response in
            var maskResponse:Mask
            guard let json_response = response.value as? [String: Int] else {
                                   return
                               }
            guard let nomask = json_response["nomask"] as? Int,
                let totalmask = json_response["totalmask"] as? Int,
                let isMask = json_response["isMask"] as? Int else {
                    print("error on /stat")
                    return
            }
            maskResponse = Mask(totalMask: totalmask, noMask: nomask, mask: isMask)
            
            print(maskResponse)
            completion(maskResponse)
        }
    }
    
   
}
