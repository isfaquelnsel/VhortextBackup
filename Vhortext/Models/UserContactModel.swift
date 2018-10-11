//
//  UserContactModel.swift
//  Vhortext
//
//  Created by MacBook Pro on 09/10/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import Foundation

class UserContactModel: NSObject {
    
    static var shared = UserContactModel()
    
    let databaseFileName = DatabaseConstants.DATABASE_NAME
    var pathToDatabase: String!
    var database: FMDatabase!
    
    override init() {
        super.init()
        
        let documentsDirectory = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString) as String
        pathToDatabase = documentsDirectory.appending("/\(databaseFileName)")
        
        print("Path of the dataBases \(pathToDatabase)")
    }
    
    
    /*MARK:--------------------------Insert User(start)-----------------------------------------*/
    func insertUser(userData: UserData) -> Bool {
        
        database = FMDatabase(path: pathToDatabase!)
        
        if database != nil {
            // Open the database.
            if database.open() {

                let ContactsQuery = "INSERT INTO "+DatabaseConstants.tableName.TABLE_CONTACT_USER+" (" +
                    DatabaseConstants.columnName.CONTACT_USER_ID+", " +
                    DatabaseConstants.columnName.CONTACT_USER_MOBILE+", " +
                    DatabaseConstants.columnName.CONTACT_USER_NAME+", " +
                    DatabaseConstants.columnName.CONTACT_USER_COUNTRY_CODE+", " +
                    DatabaseConstants.columnName.CONTACT_USER_BLOCK_STATUS+", " +
                    DatabaseConstants.columnName.CONTACT_USER_PROFILE_PHOTO+", " +
                    DatabaseConstants.columnName.CONTACT_USER_PROFILE_STATUS+", " +
                    DatabaseConstants.columnName.CONTACT_USER_FAVORITE_STATUS+", " +
                    DatabaseConstants.columnName.CONTACT_USER_RELATION_STATUS+", " +
                    DatabaseConstants.columnName.CONTACT_USER_GENDER_NAME+", " +
                    DatabaseConstants.columnName.CONTACT_USER_LANGUAGE_ID+", " +
                    DatabaseConstants.columnName.CONTACT_USER_LANGUAGE_NAME+", " +
                    DatabaseConstants.columnName.CONTACT_USER_KNOWN_STATUS+", " +
                    DatabaseConstants.columnName.CONTACT_USER_NUMBER_PRIVATE_PERMISSION+", " +
                    DatabaseConstants.columnName.CONTACT_USER_MY_BLOCK_STATUS+", " +
                    DatabaseConstants.columnName.CONTACT_USER_APP_VERSION+", " +
                    DatabaseConstants.columnName.CONTACT_USER_APP_TYPE+", " +
                    DatabaseConstants.columnName.CONTACT_USER_ONLINE_PERMISSION+", " +
                    DatabaseConstants.columnName.CONTACT_USER_COUNTRY_NAME+")" +
                "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
                
                let isInserted = UserContactModel.shared.database.executeUpdate(ContactsQuery,  withArgumentsIn: [
                    userData.usrId,
                    userData.usrMobileNo,
                    userData.usrUserName,
                    userData.usrCountryCode,
                    userData.usrBlockStatus,
                    userData.usrProfileImage,
                    userData.usrProfileStatus,
                    userData.usrFavoriteStatus,
                    userData.usrRelationStatus,
                    userData.usrGender,
                    userData.usrLanguageId,
                    userData.usrLanguageName,
                    userData.usrKnownStatus,
                    userData.usrNumberPrivatePermission,
                    userData.usrMyBlockStatus,
                    userData.usrAppVersion,
                    userData.usrAppType,
                    userData.usrOnlinePermission,
                    userData.usrCountryName
                    ])
                
                UserContactModel.shared.database.close()
                return isInserted
            }}
        return true
        
    }
    /*MARK:--------------------------Insert User(end)-----------------------------------------*/
    
    /*MARK:--------------------------Get All Users(start)-----------------------------------------*/
    func getUsers() -> NSMutableArray {
        
        let usersList : NSMutableArray = NSMutableArray()
        database = FMDatabase(path: pathToDatabase!)
        
        if database != nil {
            // Open the database.
            if database.open() {
                
                let resultSet: FMResultSet! = UserContactModel.shared.database.executeQuery("SELECT * FROM "+DatabaseConstants.tableName.TABLE_CONTACT_USER, withArgumentsIn: nil)
                
                if (resultSet != nil) {
                    
                    while resultSet.next() {
                        
                        let userData = UserData()
                        
                        userData.usrId = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_ID)
                        userData.usrMobileNo = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_MOBILE)
                        userData.usrUserName = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_NAME)
                        userData.usrCountryCode = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_COUNTRY_CODE)
                        userData.usrBlockStatus = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_BLOCK_STATUS)
                        userData.usrProfileImage = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_PROFILE_PHOTO)
                        userData.usrProfileStatus = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_PROFILE_STATUS)
                        userData.usrFavoriteStatus = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_FAVORITE_STATUS)
                        userData.usrRelationStatus = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_RELATION_STATUS)
                        userData.usrGender = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_GENDER_NAME)
                        userData.usrLanguageId = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_LANGUAGE_ID)
                        userData.usrLanguageName = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_LANGUAGE_NAME)
                        userData.usrKnownStatus = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_ID)
                        userData.usrId = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_KNOWN_STATUS)
                        userData.usrNumberPrivatePermission = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_NUMBER_PRIVATE_PERMISSION)
                        userData.usrMyBlockStatus = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_MY_BLOCK_STATUS)
                        userData.usrAppVersion = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_APP_VERSION)
                        userData.usrAppType = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_APP_TYPE)
                        userData.usrOnlinePermission = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_ONLINE_PERMISSION)
                        userData.usrCountryName = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_COUNTRY_NAME)

                        usersList.add(userData)
                    }
                    
                }
            }
        }
        
        UserContactModel.shared.database.close()
        return usersList
    }
    /*MARK:--------------------------Get All Users(end)-----------------------------------------*/
    
    /*MARK:--------------------------Get Single User(start)-----------------------------------------*/
    func getUser(usrId: String) -> UserData {
        
        let userData = UserData()
        database = FMDatabase(path: pathToDatabase!)
        
        if database != nil {
            // Open the database.
            if database.open() {
                
                let resultSet: FMResultSet! = UserContactModel.shared.database.executeQuery("SELECT * FROM "+DatabaseConstants.tableName.TABLE_CONTACT_USER+" WHERE "+DatabaseConstants.columnName.CONTACT_USER_ID+" = "+usrId, withArgumentsIn: nil)
                
                
                if (resultSet != nil) {
                    
                    while resultSet.next() {
                        
                        userData.usrId = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_ID)
                        userData.usrMobileNo = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_MOBILE)
                        userData.usrUserName = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_NAME)
                        userData.usrCountryCode = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_COUNTRY_CODE)
                        userData.usrBlockStatus = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_BLOCK_STATUS)
                        userData.usrProfileImage = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_PROFILE_PHOTO)
                        userData.usrProfileStatus = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_PROFILE_STATUS)
                        userData.usrFavoriteStatus = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_FAVORITE_STATUS)
                        userData.usrRelationStatus = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_RELATION_STATUS)
                        userData.usrGender = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_GENDER_NAME)
                        userData.usrLanguageId = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_LANGUAGE_ID)
                        userData.usrLanguageName = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_LANGUAGE_NAME)
                        userData.usrKnownStatus = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_ID)
                        userData.usrId = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_KNOWN_STATUS)
                        userData.usrNumberPrivatePermission = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_NUMBER_PRIVATE_PERMISSION)
                        userData.usrMyBlockStatus = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_MY_BLOCK_STATUS)
                        userData.usrAppVersion = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_APP_VERSION)
                        userData.usrAppType = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_APP_TYPE)
                        userData.usrOnlinePermission = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_ONLINE_PERMISSION)
                        userData.usrCountryName = resultSet.string(forColumn: DatabaseConstants.columnName.CONTACT_USER_COUNTRY_NAME)
                        
                    }}
            }
        }
        
        UserContactModel.shared.database.close()
        return userData
    }
    /*MARK:--------------------------Get Single User(end)-----------------------------------------*/
    
    /*MARK:--------------------------Check User exist(start)-----------------------------------------*/
    func isUserExist(usrId: String) -> Bool {
        
        var isExist:Bool = false
        
        database = FMDatabase(path: pathToDatabase!)
        
        if database != nil {
            // Open the database.
            
            if database.open() {
                
                let resultSet: FMResultSet! = UserContactModel.shared.database.executeQuery("SELECT * FROM "+DatabaseConstants.tableName.TABLE_CONTACT_USER+" WHERE "+DatabaseConstants.columnName.CONTACT_USER_ID+" = "+usrId, withArgumentsIn: nil)
                
                if (resultSet != nil) {
                    isExist = true
                }
            }
        }
        
        UserContactModel.shared.database.close()
        return isExist
    }
    /*MARK:--------------------------Check User Exist(end)-----------------------------------------*/
    
    
    /*MARK:--------------------------Delete All data from table(start)-----------------------------------------*/
    func deleteTableData() {
        
        
        if DatabaseManager.shared.openDatabase(){
            do {
                try DatabaseManager.shared.database.executeUpdate("DELETE FROM "+DatabaseConstants.tableName.TABLE_CONTACT_USER, values: nil)
            }
            catch {
                print(error)
                
            }
            
            DatabaseManager.shared.database.close()
        }
        
    }
    /*MARK:--------------------------Delete All data from table(end)-----------------------------------------*/
    
    
}
