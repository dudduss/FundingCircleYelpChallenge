//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    var businesses: [Business] = []
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var businessesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        self.searchBar.endEditing(true)
        
        businessesTableView.delegate = self
        businessesTableView.dataSource = self
        
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
            
            self.businessesTableView.reloadData()
        }
        
        

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("business", forIndexPath: indexPath) as! BusinessCell
        
        let business = businesses[indexPath.row]
        
        cell.businessName.text = business.name
        cell.categories.text = business.categories
        cell.distance.text = business.distance
        cell.numRatings.text = String(business.reviewCount!) + " reviews"
        
//        if let checkedUrl = NSURL(string: "http://www.apple.com/euro/ios/ios8/a/generic/images/og.png") {
//            cell.businessImage.contentMode = .ScaleAspectFill
//            downloadImage(checkedUrl)
//        }
        
//        let url = NSURL(string: business.imageURL)
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            let data = NSData(contentsOfURL: business.imageURL!) //make sure your image in this url does exist, otherwise unwrap in a if let check
            dispatch_async(dispatch_get_main_queue(), {
                cell.businessImage.image = UIImage(data: data!)
            });
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            let data = NSData(contentsOfURL: business.ratingImageURL!) //make sure your image in this url does exist, otherwise unwrap in a if let check
            dispatch_async(dispatch_get_main_queue(), {
                cell.ratingImage.image = UIImage(data: data!)
            });
        }
        
        cell.getDirections.layer.cornerRadius = 5
        cell.getDirections.layer.masksToBounds = true
        cell.getDirections.tag = indexPath.row
        
        
        cell.getDirections.addTarget(self, action: #selector(BusinessesViewController.goToMaps(_:)), forControlEvents: .TouchUpInside)
        
        cell.businessImage.layer.masksToBounds = true
        cell.ratingImage.layer.masksToBounds = true
        
        return cell
        
    }
    
    func goToMaps(sender: UIButton){
        let buttonTag = sender.tag
         let business = businesses[buttonTag]
        
        let lat = String(business.latitude!)
        let lon = String(business.longitude!)

        UIApplication.sharedApplication().openURL(NSURL(string: "https://www.google.com/maps/dir/Current+Location/" + lat + "," + lon)!)
        
        
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 220.0;//Choose your custom row height
    }
    
    
    
    
    //If tap on screen
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.searchBar.endEditing(true)
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {

        //
//        servicesCollectionView.userInteractionEnabled = false
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {

        
//        servicesCollectionView.userInteractionEnabled = true
        
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        print("canceled")
        
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
//        print("clicked")
        self.searchBar.endEditing(true)
        
        self.searchBusinesses()
    }
    
    func searchBusinesses() {
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
