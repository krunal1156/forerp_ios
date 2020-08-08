//
//  TaskUpdateModel.swift
//  fogerp
//
//  Created by apple on 08/08/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import Foundation
class UpdateTracker :Codable {
    
    let success :Bool
    let msg :String
    let data: data
    
    
    
    init?(success:Bool,msg:String,data:data){
        
        self.success = success
        self.msg = msg
        self.data = data
        
    }
    
    class data : Codable {
        
        
        let summary : String?
        let priority :String?
        let description : String?
        let severity :String?
        let reproducibility_notes :String?
        let tracker_type :String?
        let assigned_to :String?
        let deadline :String?
        let tag_category :String?
        let status : String?
        let percentage : String?
        
       
        init?(priority:String,summary :String,description:String,severity:String,tracker_type:String,
        status:String,percentage:String,assigned_to:String,deadline:String,reproducibility_notes:String,tag_category:String){
            self.priority = priority
            self.summary = summary
            self.description = description
            self.severity = severity
            self.tracker_type = tracker_type
            self.status = status
            self.percentage = percentage
            self.assigned_to = assigned_to
            self.deadline = deadline
            self.reproducibility_notes = reproducibility_notes
            self.tag_category = tag_category
        }
        
    }
    
    
}
