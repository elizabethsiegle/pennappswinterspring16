//
//  GoalsManager.swift
//  GoGoal
//
//  Created by Elizabeth Siegle on 1/23/16.
//  Copyright © 2016 Elizabeth Siegle. All rights reserved.
//

import Foundation

class GoalsManager {
    
    var goals = [GoalItem]()
    
    lazy private var archivePath: String = {
        let fileManager = NSFileManager.defaultManager()
        
        let documentsDirectoryURLs = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) as! [NSURL]
        
        let archiveURL = documentsDirectoryURLs.first!.URLByAppendingPathComponent("GoalItems", isDirectory: false)
        
        return archiveURL.path!
    }()
    
    func save() {
        NSKeyedArchiver.archiveRootObject(goals, toFile: archivePath)
    }
    
    private func unarchiveSavedGoals() {
        if
            NSFileManager.defaultManager().fileExistsAtPath(archivePath) {
                let savedGoals = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath) as! [GoalItem]
                
                goals = savedGoals
        }
    }
    
    init() {
        unarchiveSavedGoals()
    }
}