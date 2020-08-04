//
//  WarningList.swift
//  fogerp
//
//  Created by apple on 04/08/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import Foundation
class WarningList: Codable {
    
    
    let success : Bool
    let data:[data]!
    
    init?(success:Bool,data:[data] ){
        
        self.success = success
        self.data = data
    }
    
    
    
    class data: Codable{
        
        let id: Int
        let company_id:Int
        let warning_type:String
        let emp_id :Int
        let warning_desc:String
        let created_at :String
        let updated_at :String
        
        init?(id:Int,company_id:Int,warning_type:String,emp_id:Int,warning_desc:String,create_at:String,updated_at:String){
            
            self.id = id
            self.company_id = company_id
            self.warning_type = warning_type
            self.emp_id = emp_id
            self.warning_desc = warning_desc
            self.created_at = create_at
            self.updated_at = updated_at
           
        }
        
        
    }
    
    
    
}
