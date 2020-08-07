//
//  CreateTracker.swift
//  fogerp
//
//  Created by apple on 07/08/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import Foundation

class CreateTracker :Codable {
    
    let success :Bool
    let msg :String
    let data: data
    
    
    
    init?(success:Bool,msg:String,data:data){
        
        self.success = success
        self.msg = msg
        self.data = data
        
    }
    
    class data : Codable {
        
        let priority :String?
        let summary : String?
        let description : String?
        let company_id :Int?
        let severity :String?
        let tracker_type :String?
        let status : String?
        let percentage : String?
        let assigned_to :Int?
        let deadline :String?
        let created_by : Int?
        let department_id : Int?
        let reproducibility_notes :String?
        let tag_category :String?
        
        init?(priority:String,summary :String,description:String,company_id:Int,severity:String,tracker_type:String,
              status:String,percentage:String,assigned_to:Int,deadline:String,created_by:Int,department_id:Int,
              reproducibility_notes:String,tag_category:String){
            self.priority = priority
            self.summary = summary
            self.description = description
            self.company_id = company_id
            self.severity = severity
            self.tracker_type = tracker_type
            self.status = status
            self.percentage = percentage
            self.assigned_to = assigned_to
            self.deadline = deadline
            self.created_by = created_by
            self.department_id = department_id
            self.reproducibility_notes = reproducibility_notes
            self.tag_category = tag_category
        }
        
    }
    
    
}
