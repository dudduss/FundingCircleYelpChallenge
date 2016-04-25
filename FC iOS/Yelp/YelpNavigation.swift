//
//  YelpNavigation.swift
//  Pods
//
//  Created by Sampath Duddu on 4/24/16.
//
//

import UIKit

class YelpNavigation: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.barTintColor = UIColor(red: 215/255, green: 66/255, blue: 29/255, alpha: 1)
        self.navigationBar.tintColor = UIColor.whiteColor()
        let attributes = [
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSFontAttributeName: UIFont(name: "Avenir-Heavy", size: 20)!
        ]
        self.navigationBar.titleTextAttributes = attributes


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
