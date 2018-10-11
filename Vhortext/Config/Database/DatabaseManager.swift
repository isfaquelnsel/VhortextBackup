//
//  DatabaseManager.swift
//  Vhortext
//
//  Created by MacBook Pro on 14/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

let sharedInstance = DatabaseManager()

class DatabaseManager: NSObject {
    
    static let shared: DatabaseManager = DatabaseManager()
    let databaseFileName = DatabaseConstants.DATABASE_NAME
    
    var pathToDatabase: String!
    
    var database: FMDatabase!
    
    override init() {
        super.init()
        
        let documentsDirectory = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString) as String
        pathToDatabase = documentsDirectory.appending("/\(databaseFileName)")
        
        print("Path of the dataBases \(pathToDatabase)")
    }
    
    
    func openDatabase() -> Bool {
        if database == nil {
            if FileManager.default.fileExists(atPath: pathToDatabase) {
                database = FMDatabase(path: pathToDatabase)
            }
        }
        
        if database != nil {
            
            if database.open() {
                return true
            }
        }
        
        return false
    }
    
    
    class func getInstance() -> DatabaseManager
    {
        if(sharedInstance.database == nil)
        {
            sharedInstance.database = FMDatabase(path: DatabaseConstants.DATABASE_NAME)
        }
        return sharedInstance
    }
    
    
    func createDatabase() -> Bool {
        
        var returnCreateTable = false
        
        if !FileManager.default.fileExists(atPath: pathToDatabase) {
            
            database = FMDatabase(path: pathToDatabase!)
            
            if database != nil {
                // Open the database.
                if database.open() {
                    
                    let createTableContactUser = "CREATE  TABLE  IF NOT EXISTS "+DatabaseConstants.tableName.TABLE_CONTACT_USER+" ("+DatabaseConstants.columnName.CONTACT_USER_TABLE_ID+" INTEGER PRIMARY KEY AUTOINCREMENT, "+DatabaseConstants.columnName.CONTACT_USER_ID+" VARCHAR, "+DatabaseConstants.columnName.CONTACT_USER_MOBILE+" VARCHAR, "+DatabaseConstants.columnName.CONTACT_USER_NAME+" VARCHAR, "+DatabaseConstants.columnName.CONTACT_USER_COUNTRY_CODE+" VARCHAR, "+DatabaseConstants.columnName.CONTACT_USER_BLOCK_STATUS+" VARCHAR, "+DatabaseConstants.columnName.CONTACT_USER_PROFILE_PHOTO+" VARCHAR, "+DatabaseConstants.columnName.CONTACT_USER_PROFILE_STATUS+" VARCHAR, "+DatabaseConstants.columnName.CONTACT_USER_FAVORITE_STATUS+" VARCHAR, "+DatabaseConstants.columnName.CONTACT_USER_RELATION_STATUS+" VARCHAR, "+DatabaseConstants.columnName.CONTACT_USER_GENDER_NAME+" VARCHAR, "+DatabaseConstants.columnName.CONTACT_USER_LANGUAGE_ID+" VARCHAR, "+DatabaseConstants.columnName.CONTACT_USER_LANGUAGE_NAME+" VARCHAR, "+DatabaseConstants.columnName.CONTACT_USER_KNOWN_STATUS+" VARCHAR, "+DatabaseConstants.columnName.CONTACT_USER_NUMBER_PRIVATE_PERMISSION+" VARCHAR, "+DatabaseConstants.columnName.CONTACT_USER_MY_BLOCK_STATUS+" VARCHAR,  "+DatabaseConstants.columnName.CONTACT_USER_APP_VERSION+" VARCHAR, "+DatabaseConstants.columnName.CONTACT_USER_APP_TYPE+" VARCHAR, "+DatabaseConstants.columnName.CONTACT_USER_ONLINE_PERMISSION+" VARCHAR, "+DatabaseConstants.columnName.CONTACT_USER_COUNTRY_NAME+" VARCHAR)"
                    
                    let createTableProfileStatus = "CREATE TABLE IF NOT EXISTS "+DatabaseConstants.tableName.TABLE_PROFILE_STATUS+" ("+DatabaseConstants.columnName.PROFILE_STATUS_TABLE_ID+" INTEGER PRIMARY KEY AUTOINCREMENT, "+DatabaseConstants.columnName.PROFILE_STATUS_ID+" VARCHAR, "+DatabaseConstants.columnName.PROFILE_STATUS_NAME+" VARCHAR, "+DatabaseConstants.columnName.PROFILE_STATUS_SELECTED+" VARCHAR, "+DatabaseConstants.columnName.PROFILE_STATUS_APP_VERSION+" VARCHAR, "+DatabaseConstants.columnName.PROFILE_STATUS_APP_TYPE+" VARCHAR)"

                    do {
                        
                        try database.executeUpdate(createTableContactUser, values: nil)
                        try database.executeUpdate(createTableProfileStatus, values: nil)
                        
                        returnCreateTable = true
                        
                    }
                        
                    catch {
                        print("Could not create table.")
                        print(error.localizedDescription)
                    }
                    
                    database.close()
                }
                else {
                    print("Could not open the database.")
                }
            }
        }
        
        return returnCreateTable
    }
}
