//
//  ViewController.swift
//  Memory Moments
//
//  Created by Jack Phillips on 3/28/15.
//  Copyright (c) 2015 Jack Phillips. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let file = "setUpDone.txt"
        let idfile = "PID.txt"
        
        if let dirs : [String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String] {
            let dir = dirs[0] //documents directory
            let path = dir.stringByAppendingPathComponent(file);
            let text = "Yes"
            
            //reading
            let text2 = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)
            println(text2)
            
            if(text2 == "Yes"){
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewControllerWithIdentifier("calenderPatientView") as UIViewController
                self.presentViewController(vc, animated: false, completion: nil)
            }else{
                //Getting new UserID and does connection
                let path2 = dir.stringByAppendingPathComponent(idfile);
                let text2 = "3"
                text2.writeToFile(path2, atomically: false, encoding: NSUTF8StringEncoding, error: nil);
                
            }
            
            //writing
            text.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding, error: nil);
            
            // Do any additional setup after loading the view, typically from a nib.
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

