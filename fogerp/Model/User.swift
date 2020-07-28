//
//  User.swift
//  fogerp
//
//  Created by apple on 28/07/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import Foundation


class User :Codable {
    
    let success :Bool
    let msg :String
    let data: data
    
    
    
    init?(success:Bool,msg:String,data:data){
       
        self.success = success
        self.msg = msg
        self.data = data
       
    }
    
    class data : Codable {
        
        let user_id :Int
        let role : String
        let user_activated : Int
        let compayName :String
        let companyLogo :String
        
        init?(user_id:Int,role :String,user_activated:Int,companyName:String,companyLogo:String){
            self.user_id = user_id
            self.role = role
            self.user_activated = user_activated
            self.compayName = companyName
            self.companyLogo = companyLogo
        }
        
    }
    
  
}








