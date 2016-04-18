//
//  Post.swift
//  MVP-Swift
//
//  Created by Septiyan Andika on 4/19/16.
//  Copyright © 2016 Septiyan Andika. All rights reserved.
//

import Foundation
import JSONJoy

struct Post : JSONJoy {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    init(_ decoder: JSONDecoder) throws {
        userId = try decoder["userId"].getInt()
        id = try decoder["id"].getInt()
        title = try decoder["title"].getString()
        body = try decoder["body"].getString()
    }
}