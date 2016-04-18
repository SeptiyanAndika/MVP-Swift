//
//  ViewPresenster.swift
//  pattern1
//
//  Created by Septiyan Andika on 4/19/16.
//  Copyright © 2016 Septiyan Andika. All rights reserved.
//

import UIKit

protocol ViewPresensterProtocol
{
    func presentFetchFollowerPosts(hasil: Double)
    func error(message: String)
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
    
    
}
