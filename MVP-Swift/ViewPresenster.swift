//
//  ViewPresenster.swift
//  pattern1
//
//  Created by Septiyan Andika on 4/19/16.
//  Copyright © 2016 Septiyan Andika. All rights reserved.
//

import UIKit
import JSONJoy


protocol ViewPresensterProtocol
{
    func presentFetchFollowerPosts(hasil: Double)
    func error(message: String)
    func showPost(posts: [Post])
}

class ViewPresenster: NSObject {
    var presenter: ViewPresensterProtocol!
    
    init(presenter:ViewPresensterProtocol) {
        self.presenter = presenter;
    }
    
    func hitung(param1:String,param2:String){
        if let angka1 = Double(param1), angka2 = Double(param2) {
            presenter.presentFetchFollowerPosts(angka1+angka2)
        } else {
            presenter.error("Error parsing angka")
        }
    }
    
    func getPost(){
        APIManager.getPosts { (results, error) in
            var posts = Array<Post>()
            if let arr =  JSONDecoder(results!).array {
                for decoder in arr {
                    do {
                        posts.append(try Post(decoder))
                    } catch {
                        print("unable to parse the JSON")
                    }
                    
                }
                
            }
            self.presenter.showPost(posts)
        };
    }
    
    
}
