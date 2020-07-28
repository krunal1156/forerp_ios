//
//  LoginRes.swift
//  fogerp
//
//  Created by apple on 28/07/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import Foundation

class LoginRes :Codable {
    
    let success :Bool
    let msg :String
    let data:tokendata
    
    
    
    init?(success:Bool,msg:String,data:tokendata){
        
        self.success = success
        self.data = data
        self.msg = msg
        
        
    }
    
    
    
    
    class tokendata:Codable{
        let access_token:String
        init?(roletype:String){
            self.access_token = roletype
        }
    }
}

