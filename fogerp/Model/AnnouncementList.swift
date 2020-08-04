//
//  AnnouncementList.swift
//  fogerp
//
//  Created by apple on 04/08/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import Foundation
class AnnouncementList: Codable {
    
    
    let success : Bool
    let data:[data]!
    
    init?(success:Bool,data:[data] ){
        
        self.success = success
        self.data = data
    }
    
    
    
    class data: Codable{
        
        let id: Int
        let company_id:Int
        let announce_by:String
         let short_msg:String
        let decription:String
         let status:String
       
        
        let created_at :String
        let updated_at :String
        
        init?(id:Int,company_id:Int,announce_by:String,short_msg:String,decription:String,status:String,createdat:String,updated_at:String){
            
            self.id = id
            self.company_id = company_id
            self.announce_by = announce_by
            self.short_msg = short_msg
            self.decription = decription
             self.status = status
            self.created_at = createdat
            self.updated_at = updated_at
            
        }
        
        
    }
    
    
    
}
