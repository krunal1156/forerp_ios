//
//  TrackerList.swift
//  fogerp
//
//  Created by apple on 29/07/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import Foundation
class TrackerList: Codable {
    
    
    let success : Bool
    let data:[data]!
    
    init?(success:Bool,data:[data] ){
        
        self.success = success
        self.data = data
    }
    
    
    
    class data: Codable{
       
        let id: Int
        let company_id: Int
        let department_id:Int
        let priority: String
        let summary: String
        let description: String
        let severity: String
        let reproducibility_notes: String
        let assigned_to: String
        let tracker_type: String
        let deadline: String
        let created_by: String
        let tag_category: String
        let status: String
        let percentage: String
        let created_at: String
        let updated_at: String
        let assigned_to_name: String
        let assigned_to_profile: String
        let created_by_name: String
        let created_by_profile: String
        
        init?(id:Int,company_id:Int,department_id:Int,priority:String,summary:String,description:String,severity:String,reproducibility_notes:String,assigned_to:String,tracker_type:String,deadline:String,created_by:String,tag_category:String,status:String,percentage:String,created_at:String,updated_at:String,assigned_to_profile:String,created_by_name:String,created_by_profile:String,cerated_at:String){
            
            self.id = id
            self.company_id = company_id
            self.department_id = department_id
            self.priority = priority
            self.summary = summary
            self.description = description
            self.severity = severity
            self.reproducibility_notes = reproducibility_notes
            self.assigned_to = assigned_to
            self.tracker_type = tracker_type
            self.deadline = deadline
            self.created_by = created_by
            self.tag_category = tag_category
            self.status = status
            self.percentage = percentage
            self.created_at = cerated_at
            self.updated_at = updated_at
            self.assigned_to_name = assigned_to
            self.assigned_to_profile = assigned_to_profile
            self.created_by_name = created_by_name
            self.created_by_profile = created_by_profile
        }
        
        
    }
    
    
 
}
