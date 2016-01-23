//
//  GoalItem.swift
//  GoGoal
//
//  Created by Elizabeth Siegle on 1/23/16.
//  Copyright © 2016 Elizabeth Siegle. All rights reserved.
//

import UIKit

class GoalItem: NSObject, NSCoding {
    let name: String
    var photo: UIImage?
    
    var completed: Bool {
        get {
            return photo != nil
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
    let nameKey = "name"
    let photoKey = "photo"
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: nameKey)
        if let thePhoto = photo {
            aCoder.encodeObject(thePhoto, forKey: photoKey)
        }
    }
    
    required init?(coder aDecoder: NSCoder) { //if subclass a class, new initializer is required -> also need to init new decoder
        //new init required bc added new things, methods, vars, etc
        name = aDecoder.decodeObjectForKey(nameKey) as! String //must be string
        photo = aDecoder.decodeObjectForKey(photoKey) as? UIImage //may be nil. may not have a pic/be a pic = not done w/ item
        
    }

}
