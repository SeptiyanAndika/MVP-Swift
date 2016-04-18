//
//  APIPost.swift
//  MVP-Swift
//
//  Created by Septiyan Andika on 4/19/16.
//  Copyright © 2016 Septiyan Andika. All rights reserved.
//

import Foundation
import Alamofire

extension APIManager{
    
    enum PostRouter: URLRequestConvertible {
        
        case Posts
        case PostDetail(String)
        
         var URLRequest: NSMutableURLRequest {
            let result: (path: String, method: Alamofire.Method, parameters: [String: AnyObject]) = {
                switch self {
                case .Posts:
                    return ("/posts", .GET,[String: AnyObject]())
                case .PostDetail(let postID):
                    return ("/posts/\(postID)", .GET, [String: AnyObject]())
                }
            }()
            
            let URL = NSURL(string: baseURLString)!
            let URLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(result.path))
            URLRequest.HTTPMethod = result.method.rawValue
            
            let encoding = Alamofire.ParameterEncoding.URL
            
            return encoding.encode(URLRequest, parameters: result.parameters).0
        }
    }
    
    static func getPosts(completion: (results: AnyObject?, error: NSError?) -> Void ){
        Alamofire.request(APIManager.PostRouter.Posts)
            .responseJSON {
                response in
                switch response.result {
                case let .Success(results):
                    
                    return completion(results: results, error: nil)
                    
                case let .Failure(err):
                    return completion(results: nil, error: err)
                }

        }
    }


}