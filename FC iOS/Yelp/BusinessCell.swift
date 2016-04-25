//
//  BusinessCell.swift
//  Yelp
//
//  Created by Sampath Duddu on 4/24/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet var businessImage: UIImageView!
    @IBOutlet var businessName: UILabel!
    @IBOutlet var ratingImage: UIImageView!
    @IBOutlet var numRatings: UILabel!
    @IBOutlet var categories: UILabel!
    @IBOutlet var distance: UILabel!
    
    @IBOutlet var getDirections: UIButton!
}
