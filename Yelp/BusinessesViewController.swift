//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController {

    var businesses: [Business]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        Business.searchWithTerm("restaurant", completion: { (businesses: [Business]!, error: NSError!) -> Void in
//            self.businesses = businesses
//        
//            for business in businesses {
//                print(business.name!)
//                print(business.address!)
//                print(business.categories)
////                print(business.)
//            }
//            
//            print(businesses.count)
//        })
        
        
        Business.searchWithTerm("", sort: .HighestRated, categories: [], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            
            for business in businesses {
//                print(business.name!)
//                print(business.address!)
//                print(business.rating!)
                print(business.categories!)
            }
        }

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
