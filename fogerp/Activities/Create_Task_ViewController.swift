//
//  Create_Task_ViewController.swift
//  fogerp
//
//  Created by apple on 30/06/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import UIKit

class Create_Task_ViewController: UIViewController,  PopUpDelegate,typedelegate{
    
    func handleType(action: String){
        print(action)
        self.tracker_type = action
    }
    @IBOutlet weak var btn_do_later: UIButton!
    @IBOutlet weak var btn_open: UIButton!
    @IBOutlet weak var btn_working: UIButton!
    @IBOutlet weak var btn_percentage: UIButton!
    @IBOutlet weak var btn_minor: UIButton!
    @IBOutlet weak var btn_major: UIButton!
    @IBOutlet weak var btn_low: UIButton!
    @IBOutlet weak var btn_normal: UIButton!
    @IBOutlet weak var btn_high: UIButton!
    @IBOutlet weak var editcontainer: CardView!
    @IBOutlet weak var btn_add_assignee: UIImageView!
    @IBOutlet weak var txt_dealine_date: UILabel!
    @IBOutlet weak var img_select_date: UIImageView!
    @IBOutlet weak var edt_task_Description: UITextField!
    @IBOutlet weak var img_btn_type: UIImageView!
    @IBOutlet weak var img_btn_createTask: UIImageView!
    @IBOutlet weak var progressbar: UIActivityIndicatorView!
    
    @IBOutlet weak var stackview: UIStackView!
   
    var radioButtonvalue :String!
    private var datePicker : UIDatePicker?
    
    var fromDate:String!
   
    
    var taskdata: TrackerList.data!
    
   
    
    
    @IBAction func click_btn_do_later(_ sender: Any) {
        btn_do_later.backgroundColor = UIColor.orange
        btn_do_later.setTitleColor(.white, for: .normal)
        
        btn_open.backgroundColor = UIColor.white
        btn_open.setTitleColor(.orange, for: .normal)
        
        btn_working.backgroundColor = UIColor.white
        btn_working.setTitleColor(.orange, for: .normal)
        
        status = "Do it Later"
        
      
    }
    
    @IBAction func click_Btn_open(_ sender: Any) {
        btn_do_later.backgroundColor = UIColor.white
        btn_do_later.setTitleColor(.orange, for: .normal)
        
        btn_open.backgroundColor = UIColor.orange
        btn_open.setTitleColor(.white, for: .normal)
        
        btn_working.backgroundColor = UIColor.white
        btn_working.setTitleColor(.orange, for: .normal)
        
        status = "Open"
    }
    
    @IBAction func click_btn_working(_ sender: Any) {
        btn_do_later.backgroundColor = UIColor.white
        btn_do_later.setTitleColor(.orange, for: .normal)
        
        btn_open.backgroundColor = UIColor.white
        btn_open.setTitleColor(.orange, for: .normal)
        
        btn_working.backgroundColor = UIColor.orange
        btn_working.setTitleColor(.white, for: .normal)
        
        status = "Working"
    }
    
    
    
    @IBAction func click_Btn_percentage(_ sender: Any) {
    }
    
    @IBAction func click_Btn_minor(_ sender: Any) {
        btn_minor.backgroundColor = UIColor.orange
        btn_minor.setTitleColor(.white, for: .normal)
        
        btn_major.backgroundColor = UIColor.white
        btn_major.setTitleColor(.orange, for: .normal)
        
        severity  = "Minor"
        
        
    }
    @IBAction func click_Btn_major(_ sender: Any) {
        btn_minor.backgroundColor = UIColor.white
        btn_minor.setTitleColor(.orange, for: .normal)
        
        btn_major.backgroundColor = UIColor.orange
        btn_major.setTitleColor(.white, for: .normal)
        
           severity  = "Major"
        
    }
    
    @IBAction func click_Btn_high(_ sender: Any) {
        btn_high.backgroundColor = UIColor.orange
        btn_high.setTitleColor(.white, for: .normal)
        
        btn_normal.backgroundColor = UIColor.white
        btn_normal.setTitleColor(.orange, for: .normal)
        
        btn_low.backgroundColor = UIColor.white
        btn_low.setTitleColor(.orange, for: .normal)
        
        priority = "High"
       
    }
    @IBAction func click_Btn_normal(_ sender: Any) {
        btn_high.backgroundColor = UIColor.white
        btn_high.setTitleColor(.orange, for: .normal)
        
        btn_normal.backgroundColor = UIColor.orange
        btn_normal.setTitleColor(.white, for: .normal)
        
        btn_low.backgroundColor = UIColor.white
        btn_low.setTitleColor(.orange, for: .normal)
        
          priority = "Normal"
        
    }
    @IBAction func click_btn_low(_ sender: Any) {
        btn_high.backgroundColor = UIColor.white
        btn_high.setTitleColor(.orange, for: .normal)
        
        btn_normal.backgroundColor = UIColor.white
        btn_normal.setTitleColor(.orange, for: .normal)
        
        btn_low.backgroundColor = UIColor.orange
        btn_low.setTitleColor(.white, for: .normal)
        
        priority = "Low"
    }
    
    @IBAction func click_add_assign(_ sender: Any) {
        Dialog_TeamList.showPopup(parentVC: self)
    }
    @IBAction func btn_back_click(_ sender: Any) {
          self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var open_calener: UIImageView!
    var user :User!
    var tracker_id :Int = 0
    var summary:String = "test task from ios"
    var descriptionn:String = ""
    var priority:String = ""
    var severity:String = ""
    var reproducibility_note:String = ""
    var assigned_to:String = ""
    var tracker_type:String = "Task"
    var deadline:String = ""
    var tag_category:String = ""
    var status:String = "Open"
    var percentage:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = PrefUtil.userdata()
        
        if(taskdata != nil ){
            edt_task_Description.text = taskdata.summary
            tracker_id = taskdata.id!
            summary = taskdata.summary!
            descriptionn = taskdata.description!
            priority = taskdata.priority!
            severity = taskdata.severity!
            reproducibility_note = taskdata.reproducibility_notes!
            assigned_to = taskdata.assigned_to!
            tracker_type = taskdata.tracker_type!
            deadline = taskdata.deadline!
            tag_category = taskdata.tag_category!
            status = taskdata.status!
            percentage = taskdata.percentage!
            
            if(taskdata.status == "Do it Later"){
                btn_do_later.backgroundColor = UIColor.orange
                btn_do_later.setTitleColor(.white, for: .normal)
                
                btn_open.backgroundColor = UIColor.white
                btn_open.setTitleColor(.orange, for: .normal)
                
                btn_working.backgroundColor = UIColor.white
                btn_working.setTitleColor(.orange, for: .normal)
            }else if(taskdata.status == "Open"){
                btn_do_later.backgroundColor = UIColor.white
                btn_do_later.setTitleColor(.orange, for: .normal)
                
                btn_open.backgroundColor = UIColor.orange
                btn_open.setTitleColor(.white, for: .normal)
                
                btn_working.backgroundColor = UIColor.white
                btn_working.setTitleColor(.orange, for: .normal)
            }else if(taskdata.status == "Working"){
                btn_do_later.backgroundColor = UIColor.white
                btn_do_later.setTitleColor(.orange, for: .normal)
                
                btn_open.backgroundColor = UIColor.white
                btn_open.setTitleColor(.orange, for: .normal)
                
                btn_working.backgroundColor = UIColor.orange
                btn_working.setTitleColor(.white, for: .normal)
            }
            
            
            if(taskdata.severity == "Minor"){
                btn_minor.backgroundColor = UIColor.orange
                btn_minor.setTitleColor(.white, for: .normal)
                
                btn_major.backgroundColor = UIColor.white
                btn_major.setTitleColor(.orange, for: .normal)
                
            }else{
                btn_minor.backgroundColor = UIColor.white
                btn_minor.setTitleColor(.orange, for: .normal)
                
                btn_major.backgroundColor = UIColor.orange
                btn_major.setTitleColor(.white, for: .normal)
                
            }
            
            
            if(taskdata.priority == "High"){
                btn_high.backgroundColor = UIColor.orange
                btn_high.setTitleColor(.white, for: .normal)
                
                btn_normal.backgroundColor = UIColor.white
                btn_normal.setTitleColor(.orange, for: .normal)
                
                btn_low.backgroundColor = UIColor.white
                btn_low.setTitleColor(.orange, for: .normal)
                
            }else if(taskdata.priority == "Normal"){
                btn_high.backgroundColor = UIColor.white
                btn_high.setTitleColor(.orange, for: .normal)
                
                btn_normal.backgroundColor = UIColor.orange
                btn_normal.setTitleColor(.white, for: .normal)
                
                btn_low.backgroundColor = UIColor.white
                btn_low.setTitleColor(.orange, for: .normal)
                
            }else if(taskdata.priority == "Low"){
                
                btn_high.backgroundColor = UIColor.white
                btn_high.setTitleColor(.orange, for: .normal)
                
                btn_normal.backgroundColor = UIColor.white
                btn_normal.setTitleColor(.orange, for: .normal)
                
                btn_low.backgroundColor = UIColor.orange
                btn_low.setTitleColor(.white, for: .normal)
                
            }
            
        }
        
        
         editcontainer.roundCorners(corners: [.topRight,.bottomRight,.topLeft,.bottomLeft], radius: 30.0)
        
         btn_do_later.roundCorners(corners: [.topLeft,.bottomLeft], radius: 30.0)
         btn_working.roundCorners(corners: [.topRight,.bottomRight], radius: 30.0)

        btn_minor.roundCorners(corners: [.topLeft,.bottomLeft], radius: 30.0)
        btn_major.roundCorners(corners: [.topRight,.bottomRight], radius: 30.0)

        
        btn_low.roundCorners(corners: [.topLeft,.bottomLeft], radius: 30.0)
        btn_high.roundCorners(corners: [.topRight,.bottomRight], radius: 30.0)

       
        let tapGestureRecognizer_D = UITapGestureRecognizer(target: self, action: #selector(taskCreate_Click(tapGestureRecognizer:)))
        img_btn_createTask.isUserInteractionEnabled = true
        img_btn_createTask.addGestureRecognizer(tapGestureRecognizer_D)
        
        
        let tap_fromdae = UITapGestureRecognizer(target: self, action: #selector(DatePicker_FromDate))
        open_calener.isUserInteractionEnabled = true
        open_calener.addGestureRecognizer(tap_fromdae)
        
        
        let tap_type = UITapGestureRecognizer(target: self, action: #selector(Open_Dialog_Type2))
        img_btn_type.isUserInteractionEnabled = true
        img_btn_type.addGestureRecognizer(tap_type)
        
        let add_assignee = UITapGestureRecognizer(target: self, action: #selector(click_add_assign))
        btn_add_assignee.isUserInteractionEnabled = true
        btn_add_assignee.addGestureRecognizer(add_assignee)
        
    }
    
    @objc func taskCreate_Click(tapGestureRecognizer: UITapGestureRecognizer)
    {
       
        if(taskdata != nil){
            self.summary = edt_task_Description.text!
            self.descriptionn = self.summary
            dataRequest_trackerUpdate(user_id: String(user.data.user_id),tracker_id: String(tracker_id))
            
        }else{
            self.summary = edt_task_Description.text!
            self.descriptionn = self.summary
            dataRequest(user_id: String(user.data.user_id))
            
        }
       
        
      
    }
    func handleAction(action: String) {
       print(action)
        let textLabel = UILabel()
         textLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        textLabel.text  = action
        textLabel.textAlignment = .center
        self.stackview.addArrangedSubview(textLabel)
        btn_add_assignee.isHidden = true
    }
    
    
    func dataRequest(user_id:String) {
        
        self.progressbar.isHidden = false
        
        let urlToRequest = ApiClient.baseurl+ApiClient.createTask
        let url4 = URL(string: urlToRequest)!
        let session4 = URLSession.shared
        let request = NSMutableURLRequest(url: url4)
        request.httpMethod = "POST"
        request.setValue("Bearer "+PrefUtil.getAccessToken(key: StaticKeys.usertoken), forHTTPHeaderField: "Authorization")
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        let paramString = "user_id="+user_id+"&summary="+summary+"&description="+descriptionn+"&priority="+priority+"&severity="+severity+"&reproducibility_notes="+reproducibility_note+"&assigned_to="+assigned_to+"&tracker_type="+tracker_type+"&deadline="+deadline+"&tag_category="+tag_category+"&status="+status+"&percentage="+percentage
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        print(paramString)
        print("Bearer "+PrefUtil.getAccessToken(key: StaticKeys.usertoken))
        
        
        let task = session4.dataTask(with: request as URLRequest)
        {
            (data, response, error) in
            guard let  _: Data = data, let _: URLResponse = response,  error == nil
                else
            {
                print("*****error")
                return
            }
            
            
            do
            {
                let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                let decoder = JSONDecoder()
                print(dataString)
                  let loginres = try decoder.decode(CreateTracker.self, from: data!)
        
                if(loginres.success == true){
                    DispatchQueue.main.async {
                        
                        self.progressbar.stopAnimating()
                        self.progressbar.isHidden = true
                        self.dismiss(animated: true, completion: nil)
                    }
                    
                }
                
                
            }catch let error {
                print("Error :  \(error)")
                
            }

            
        }
        task.resume()

    }
    
    
    
    func dataRequest_trackerUpdate(user_id:String,tracker_id:String) {
        
        self.progressbar.isHidden = false
        
        let urlToRequest = ApiClient.baseurl+ApiClient.editTask
        let url4 = URL(string: urlToRequest)!
        let session4 = URLSession.shared
        let request = NSMutableURLRequest(url: url4)
        request.httpMethod = "POST"
        request.setValue("Bearer "+PrefUtil.getAccessToken(key: StaticKeys.usertoken), forHTTPHeaderField: "Authorization")
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        let paramString = "user_id="+user_id+"&tracker_id="+tracker_id+"&summary="+summary+"&description="+descriptionn+"&priority="+priority+"&severity="+severity+"&reproducibility_notes="+reproducibility_note+"&assigned_to="+assigned_to+"&tracker_type="+tracker_type+"&deadline="+deadline+"&tag_category="+tag_category+"&status="+status+"&percentage="+percentage
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        print(paramString)
        print("Bearer "+PrefUtil.getAccessToken(key: StaticKeys.usertoken))
        
        
        let task = session4.dataTask(with: request as URLRequest)
        {
            (data, response, error) in
            guard let  _: Data = data, let _: URLResponse = response,  error == nil
                else
            {
                print("*****error")
                return
            }
            
            
            do
            {
                let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                let decoder = JSONDecoder()
                print(dataString)
                let loginres = try decoder.decode(UpdateTracker.self, from: data!)
                
                if(loginres.success == true){
                    DispatchQueue.main.async {
                        
                        self.progressbar.stopAnimating()
                        self.progressbar.isHidden = true
                        self.dismiss(animated: true, completion: nil)
                    }
                    
                }
                
                
            }catch let error {
                print("Error :  \(error)")
                
            }
            
            
        }
        task.resume()
        
    }
    
    
    
    @objc func Open_Dialog_Type2() {
         Dialog_Type.showPopup(parentVC: self)
    }

    @objc func DatePicker_FromDate() {
        

            let currentDate: Date = Date()
            var calendar: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
            var components: DateComponents = DateComponents()
            
            var minDate: Date!
            let maxDate: Date!
            
    
                components.day = 5
                minDate = calendar.date(byAdding: components, to: currentDate)!
                
                let datePicker = DatePickerDialog(textColor: .blue,buttonColor: .red,font: UIFont.boldSystemFont(ofSize: 17),showCancelButton: true)
                datePicker.show("Select From Date",
                                doneButtonTitle: "Done",
                                cancelButtonTitle: "Cancel",
                                minimumDate: minDate,
                                
                                datePickerMode: .date)
                { (date) in
                    if var dt = date
                    {
                        
                        
                        let dateFormatter: DateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "dd/MM/yyyy"
                        self.fromDate = dateFormatter.string(from: dt)
                        print("Selected value \(self.fromDate)")
                        let calendar = Calendar.current
                        let components = calendar.dateComponents([.day,.month,.year], from: dt)
                        if let day = components.day, let month = components.month, let year = components.year
                        {
                           // self.monthid = String(month)
                           // print(self.monthid)
                            
                        }
                        
                        
                    }
                    
                }

    }
    
    @objc func From_datePickerValueChanged(_ sender: UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        fromDate = dateFormatter.string(from: sender.date)
        print("Selected value \(fromDate)")
        self.txt_dealine_date.text = fromDate
        
        
        
    }
}





