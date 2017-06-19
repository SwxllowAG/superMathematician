//
//  ViewController.swift
//  superMathematician
//
//  Created by Galym Anuarbek on 6/15/17.
//  Copyright © 2017 Galym Anuarbek. All rights reserved.
//

import UIKit

var levell: Int = 1

protocol Communicatable {
    func get(message: String?, score: String?)
}

class ViewController: UIViewController {

    
    @IBAction func easyL(_ sender: Any) {
        levell=1
    }
    
    @IBAction func mediumL(_ sender: Any) {
        levell=2
    }
    
    @IBAction func hardL(_ sender: Any) {
        levell=3
    }
    
    
    @IBAction func playButton(_ sender: Any) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

