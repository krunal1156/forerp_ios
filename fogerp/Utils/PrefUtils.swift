//
//  PrefUtils.swift
//  fogerp
//
//  Created by apple on 28/07/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import Foundation

struct PrefUtil {
    
    
    
    static func saveAccessToken(data: String,key:String){
        let preferences = UserDefaults.standard
        //print("saveAccessToken : \(access_token)")
        preferences.set(data, forKey: key)
        didSave(preferences: preferences)
    }
    
    static func getAccessToken(key:String) -> String
    {
        let preferences = UserDefaults.standard
        if preferences.string(forKey: key) != nil
        {
            let access_token = preferences.string(forKey: key)
            return access_token!
        }
        else
        {
            return ""
        }
    }
    
    
    static func didSave(preferences: UserDefaults)
    {
        let didSave = preferences.synchronize()
        if !didSave
        {
            // Couldn't Save
            print("Preferences could not be saved!")
        }
        else
        {
            //print(getAccessToken())
            print("data saved")
        }
    }
    
    static func clearData(key:String){
        UserDefaults.standard.removeObject(forKey: key)
        print("dataclear")
    }
    
    
    
    static func userdata() ->User?{
        
        
        var user:User!
        if(PrefUtil.getAccessToken(key: StaticKeys.userdata) != ""){
            
            do {
                let string = PrefUtil.getAccessToken(key: StaticKeys.userdata)
                let data = string.data(using: .utf8)!
                let decoder = JSONDecoder()
                user = try decoder.decode(User.self, from: data)
                print(user.data.companyLogo)
                return user
                
                
                
            } catch let err {
                print("Err", err)
                
                
            }
            
            
            return user
        }
        
        return nil
    }
    
    
    
    
}
