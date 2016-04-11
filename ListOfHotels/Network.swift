//
//  Network.swift
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 24/03/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

import Foundation

func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}


public class Network : NSObject {
    
    func getURL(url: NSURL, completion: (data: NSData?, error: NSError?) -> ()) {
        
        let file = NSBundle.mainBundle().pathForResource("hotels_sample", ofType: "json")
        
        guard let data = NSData(contentsOfFile: file!) else {
            let error = NSError(domain: "hotels.com", code: 1, userInfo: nil)
            completion(data: nil, error: error)
            return
        }
        
        delay(1) { () -> () in
            completion(data: data, error: nil)
        }
        
        
    }
}