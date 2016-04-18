//
//  APIManager.swift
//  MVP-Swift
//
//  Created by Septiyan Andika on 4/19/16.
//  Copyright © 2016 Septiyan Andika. All rights reserved.
//

import Foundation
import Alamofire

struct APIManager {
    #if PRODUCTION
    static let baseURLString = "https://api.prodcution.com"
    #else
    static let baseURLString = "http://api.staging.com"
    #endif
}