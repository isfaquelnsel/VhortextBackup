//
//  ProfileStatusModel.swift
//  Vhortext
//
//  Created by MacBook Pro on 10/10/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import Foundation

class ProfileStatusModel: NSObject {
    
    static var shared = ProfileStatusModel()
    
    let databaseFileName = DatabaseConstants.DATABASE_NAME
    var pathToDatabase: String!
    var database: FMDatabase!
    
    override init() {
        super.init()
        
        let documentsDirectory = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString) as String
        pathToDatabase = documentsDirectory.appending("/\(databaseFileName)")
        
        print("Path of the dataBases \(pathToDatabase)")
    }
    
}
