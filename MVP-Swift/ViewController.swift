//
//  ViewController.swift
//  MVP-Swift
//
//  Created by Septiyan Andika on 4/19/16.
//  Copyright © 2016 Septiyan Andika. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var fieldParam1: UITextField!
    @IBOutlet weak var fieldParam2: UITextField!
    @IBOutlet weak var labelHasil: UILabel!
    
    var presenter: ViewPresenster!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ViewPresenster(presenter: self);
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func hitung(sender: AnyObject) {
          presenter.hitung(fieldParam1.text!,param2: fieldParam2.text!)
    }

}


extension ViewController:ViewPresensterProtocol{
    func presentFetchFollowerPosts(hasil: Double){
        labelHasil.text = ": \(hasil)"
    }
    
    func error(message: String){
        self.showAlert("Error", message: message)
    }
    
}

