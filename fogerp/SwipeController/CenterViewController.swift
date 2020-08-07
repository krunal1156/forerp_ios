/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class CenterViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(tracker_list.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"SingleRow_tasklist_Dashboard")as!SingleRow_tasklist_Dashboard
    
        cell.txtTitle.text = tracker_list[indexPath.row].description
        cell.txtpercentage.text = tracker_list[indexPath.row].percentage
        cell.txtDeadline.text = tracker_list[indexPath.row].deadline
        cell.txtCreatedDate.text = tracker_list[indexPath.row].created_at
       
        return cell
        
        
        
        
        
    }
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var progressbar: UIActivityIndicatorView!
    
    @IBOutlet weak var img_create_newtask: UIImageView!{
    didSet {
    let imageTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
    img_create_newtask.addGestureRecognizer(imageTapGestureRecognizer)
    img_create_newtask.isUserInteractionEnabled = true
    }
}

    @objc func imageTapped() {
    //navigate to another view controller
     print("image tap")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVc = storyboard.instantiateViewController(withIdentifier: "Create_Task_ViewController") as! Create_Task_ViewController
        self.present(nextVc, animated: true, completion: nil)
}
    
    @IBOutlet weak var table_view: UITableView!
    @IBOutlet weak var TaskListContainer: UIView!
    @IBOutlet weak var Btn_Me: UIButton!
    @IBOutlet weak var Btn_Team: UIButton!
    
    @IBOutlet weak var Btn_all: UIButton!
    @IBOutlet weak var Btn_Major: UIButton!
    @IBOutlet weak var Btn_Minor: UIButton!
    
    @IBOutlet weak var Btn_All_s: UIButton!
    @IBOutlet weak var Btn_Low: UIButton!
    @IBOutlet weak var Btn_Normal: UIButton!
    @IBOutlet weak var Btn_High: UIButton!
    
    @IBOutlet weak var Btn_All_d: UIButton!
    @IBOutlet weak var Btn_This_month: UIButton!
    
    @IBOutlet weak var Btn_Today: UIButton!
    
    @IBOutlet weak var Btn_Tomorrow: UIButton!
    
    @IBOutlet weak var Btn_this_Week: UIButton!
    
   
    
    @IBAction func click_btnMe(_ sender: Any) {
        allocated = "My"
          dataRequest(user_id: String(user.data.user_id), allocated: allocated, status: status, priority: priority, severity:severity, type: type, day: day, deadline: deadline, allocated_to: allocated_to)
        
        Btn_Me.backgroundColor = UIColor.orange
        Btn_Me.setTitleColor(.white, for: .normal)
        
        Btn_Team.backgroundColor = UIColor.white
        Btn_Team.setTitleColor(.orange, for: .normal)
    }
    
    @IBAction func click_btnTeam(_ sender: Any) {
        allocated = "Team"
        dataRequest(user_id: String(user.data.user_id), allocated: allocated, status: status, priority: priority, severity:severity, type: type, day: day, deadline: deadline, allocated_to: allocated_to)
       
        Btn_Me.backgroundColor = UIColor.white
        Btn_Me.setTitleColor(.orange, for: .normal)
        
        Btn_Team.backgroundColor = UIColor.orange
         Btn_Team.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func click_btnAll(_ sender: Any) {
      
        severity = ""
        dataRequest(user_id: String(user.data.user_id), allocated: allocated, status: status, priority: priority, severity:severity, type: type, day: day, deadline: deadline, allocated_to: allocated_to)
        
        
        Btn_all.backgroundColor = UIColor.orange
        Btn_all.setTitleColor(.white, for: .normal)
        
        Btn_Major.backgroundColor = UIColor.white
        Btn_Major.setTitleColor(.orange, for: .normal)
        
        Btn_Minor.backgroundColor = UIColor.white
        Btn_Minor.setTitleColor(.orange, for: .normal)
        
    }
    
    @IBAction func click_btnMajor(_ sender: Any) {
        severity = "Major"
        dataRequest(user_id: String(user.data.user_id), allocated: allocated, status: status, priority: priority, severity:severity, type: type, day: day, deadline: deadline, allocated_to: allocated_to)
        
        Btn_all.backgroundColor = UIColor.white
        Btn_all.setTitleColor(.orange, for: .normal)
        
        Btn_Major.backgroundColor = UIColor.orange
        Btn_Major.setTitleColor(.white, for: .normal)
        
        Btn_Minor.backgroundColor = UIColor.white
        Btn_Minor.setTitleColor(.orange, for: .normal)
    }
    
    @IBAction func click_btnMinor(_ sender: Any) {
        severity = "Minor"
        dataRequest(user_id: String(user.data.user_id), allocated: allocated, status: status, priority: priority, severity:severity, type: type, day: day, deadline: deadline, allocated_to: allocated_to)
        
        Btn_all.backgroundColor = UIColor.white
        Btn_all.setTitleColor(.orange, for: .normal)
        
        Btn_Major.backgroundColor = UIColor.white
        Btn_Major.setTitleColor(.orange, for: .normal)
        
        Btn_Minor.backgroundColor = UIColor.orange
        Btn_Minor.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func click_btnAlls(_ sender: Any) {
        priority = ""
        dataRequest(user_id: String(user.data.user_id), allocated: allocated, status: status, priority: priority, severity:severity, type: type, day: day, deadline: deadline, allocated_to: allocated_to)
        
        Btn_All_s.backgroundColor = UIColor.orange
        Btn_All_s.setTitleColor(.white, for: .normal)
        
        Btn_Low.backgroundColor = UIColor.white
        Btn_Low.setTitleColor(.orange, for: .normal)
        
        Btn_Normal.backgroundColor = UIColor.white
        Btn_Normal.setTitleColor(.orange, for: .normal)
        
        Btn_High.backgroundColor = UIColor.white
        Btn_High.setTitleColor(.orange, for: .normal)
    }
    
    @IBAction func click_btnLow(_ sender: Any) {
        priority = "Low"
        dataRequest(user_id: String(user.data.user_id), allocated: allocated, status: status, priority: priority, severity:severity, type: type, day: day, deadline: deadline, allocated_to: allocated_to)
        
        Btn_All_s.backgroundColor = UIColor.white
        Btn_All_s.setTitleColor(.orange, for: .normal)
        
        Btn_Low.backgroundColor = UIColor.orange
        Btn_Low.setTitleColor(.white, for: .normal)
        
        Btn_Normal.backgroundColor = UIColor.white
        Btn_Normal.setTitleColor(.orange, for: .normal)
        
        Btn_High.backgroundColor = UIColor.white
        Btn_High.setTitleColor(.orange, for: .normal)
    }
    
    @IBAction func click_btnNormal(_ sender: Any) {
        priority = "Normal"
        dataRequest(user_id: String(user.data.user_id), allocated: allocated, status: status, priority: priority, severity:severity, type: type, day: day, deadline: deadline, allocated_to: allocated_to)
        
        Btn_All_s.backgroundColor = UIColor.white
        Btn_All_s.setTitleColor(.orange, for: .normal)
        
        Btn_Low.backgroundColor = UIColor.white
        Btn_Low.setTitleColor(.orange, for: .normal)
        
        Btn_Normal.backgroundColor = UIColor.orange
        Btn_Normal.setTitleColor(.white, for: .normal)
        
        Btn_High.backgroundColor = UIColor.white
        Btn_High.setTitleColor(.orange, for: .normal)
    }
    
    @IBAction func click_btnHight(_ sender: Any) {
        priority = "High"
        dataRequest(user_id: String(user.data.user_id), allocated: allocated, status: status, priority: priority, severity:severity, type: type, day: day, deadline: deadline, allocated_to: allocated_to)
        
        Btn_All_s.backgroundColor = UIColor.white
        Btn_All_s.setTitleColor(.orange, for: .normal)
        
        Btn_Low.backgroundColor = UIColor.white
        Btn_Low.setTitleColor(.orange, for: .normal)
        
        Btn_Normal.backgroundColor = UIColor.white
        Btn_Normal.setTitleColor(.orange, for: .normal)
        
        Btn_High.backgroundColor = UIColor.orange
        Btn_High.setTitleColor(.white, for: .normal)
    }
    @IBAction func click_btnAllD(_ sender: Any) {
        day = "all"
         dataRequest(user_id: String(user.data.user_id), allocated: allocated, status: status, priority: priority, severity:severity, type: type, day: day, deadline: deadline, allocated_to: allocated_to)
    }
    
    @IBAction func click_btnToday(_ sender: Any) {
        day = "today"
        dataRequest(user_id: String(user.data.user_id), allocated: allocated, status: status, priority: priority, severity:severity, type: type, day: day, deadline: deadline, allocated_to: allocated_to)
    }
    
    @IBAction func click_btnTomorrow(_ sender: Any) {
        day = "tomorrow"
        dataRequest(user_id: String(user.data.user_id), allocated: allocated, status: status, priority: priority, severity:severity, type: type, day: day, deadline: deadline, allocated_to: allocated_to)
    }
    @IBAction func click_btnThisWeek(_ sender: Any) {
        day = "this_week"
        dataRequest(user_id: String(user.data.user_id), allocated: allocated, status: status, priority: priority, severity:severity, type: type, day: day, deadline: deadline, allocated_to: allocated_to)
    }
    
    @IBAction func click_btnThisMonth(_ sender: Any) {
        day = "this_month"
        dataRequest(user_id: String(user.data.user_id), allocated: allocated, status: status, priority: priority, severity:severity, type: type, day: day, deadline: deadline, allocated_to: allocated_to)
    }
    
    
    
    
    let backgroundImageView = UIImageView()
    var delegate: CenterViewControllerDelegate?
  
  // MARK: Button actions  
    @IBAction func leftbuttonclick(_ sender: Any) {  delegate?.toggleLeftPanel() }
    @IBAction func rightbuttonclick(_ sender: Any) { delegate?.toggleRightPanel() }
    
    @IBAction func btn_report_click(_ sender: Any) {
        delegate?.toggleRightPanel()
        print("data  found")
    }
    @IBAction func btn_type_click(_ sender: Any) {
        delegate?.toggleLeftPanel()
        print("data  found")
    }
    
    @IBOutlet weak var Img_D_Type: UIImageView!
    
    @IBOutlet weak var Img_C_Type: UIImageView!
    
    @IBOutlet weak var Img_O_Type: UIImageView!
    
    @IBOutlet weak var Img_W_Type: UIImageView!
    
    
    
    
    
    var user :User!
    var tracker_list = [TrackerList.data]()
    var allocated:String = "My"
    var status:String = "Open"
    var priority:String = ""
    var severity:String = ""
    var type:String = ""
    var day:String = ""
    var deadline:String = ""
    var allocated_to:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.addSubview(backgroundImageView)
        user = PrefUtil.userdata() 
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo:view.trailingAnchor).isActive = true
        backgroundImageView.image = UIImage(named :"newbgtwo.png")
        view.sendSubviewToBack(backgroundImageView)

        TaskListContainer.roundCorners(corners: [.topLeft,.topRight], radius: 60.0)
        
       
        Btn_Me.roundCorners(corners: [.topLeft,.bottomLeft], radius: 30.0)
        Btn_Team.roundCorners(corners: [.topRight,.bottomRight], radius: 30.0)
        
        Btn_all.roundCorners(corners: [.topLeft,.bottomLeft], radius: 30.0)
        Btn_Minor.roundCorners(corners: [.topRight,.bottomRight], radius: 30.0)
        
        
        Btn_All_s.roundCorners(corners: [.topLeft,.bottomLeft], radius: 30.0)
        Btn_High.roundCorners(corners: [.topRight,.bottomRight], radius: 30.0)
      
        
        Btn_All_d.roundCorners(corners: [.topLeft,.bottomLeft], radius: 30.0)
        Btn_This_month.roundCorners(corners: [.topRight,.bottomRight], radius: 30.0)
 
 
        dataRequest(user_id: String(user.data.user_id), allocated: allocated, status: status, priority: priority, severity:severity, type: type, day: day, deadline: deadline, allocated_to: allocated_to)
        
        let tapGestureRecognizer_D = UITapGestureRecognizer(target: self, action: #selector(Imge_D_Click(tapGestureRecognizer:)))
        Img_D_Type.isUserInteractionEnabled = true
        Img_D_Type.addGestureRecognizer(tapGestureRecognizer_D)
        
        let tapGestureRecognizer_W = UITapGestureRecognizer(target: self, action: #selector(Imge_W_Click(tapGestureRecognizer:)))
        Img_W_Type.isUserInteractionEnabled = true
        Img_W_Type.addGestureRecognizer(tapGestureRecognizer_W)
        
        let tapGestureRecognizer_O = UITapGestureRecognizer(target: self, action: #selector(Imge_O_Click(tapGestureRecognizer:)))
        Img_O_Type.isUserInteractionEnabled = true
        Img_O_Type.addGestureRecognizer(tapGestureRecognizer_O)
        
        
        let tapGestureRecognizer_C = UITapGestureRecognizer(target: self, action: #selector(Imge_C_Click(tapGestureRecognizer:)))
        Img_C_Type.isUserInteractionEnabled = true
        Img_C_Type.addGestureRecognizer(tapGestureRecognizer_C)
    }
   
   
    @objc func Imge_D_Click(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        Img_D_Type.image = UIImage(named: "d_dark_background.png")
        Img_W_Type.image = UIImage(named: "w_light_background.png")
        Img_O_Type.image = UIImage(named: "o_light_background.png")
        Img_C_Type.image = UIImage(named: "c_light_background.png")
        status = "Do it Later"
        dataRequest(user_id: String(user.data.user_id), allocated: allocated, status: status, priority: priority, severity:severity, type: type, day: day, deadline: deadline, allocated_to: allocated_to)
        // Your action
    }
    @objc func Imge_O_Click(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        Img_D_Type.image = UIImage(named: "d_light_background.png")
        Img_W_Type.image = UIImage(named: "w_light_background.png")
        Img_O_Type.image = UIImage(named: "o_dark_background.png")
        Img_C_Type.image = UIImage(named: "c_light_background.png")
        // Your action
        status = "Open"
        dataRequest(user_id: String(user.data.user_id), allocated: allocated, status: status, priority: priority, severity:severity, type: type, day: day, deadline: deadline, allocated_to: allocated_to)
    }
    @objc func Imge_W_Click(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        Img_D_Type.image = UIImage(named: "d_light_background.png")
        Img_W_Type.image = UIImage(named: "w_dark_background.png")
        Img_O_Type.image = UIImage(named: "o_light_background.png")
        Img_C_Type.image = UIImage(named: "c_light_background.png")
        // Your action
        status = "Working"
        dataRequest(user_id: String(user.data.user_id), allocated: allocated, status: status, priority: priority, severity:severity, type: type, day: day, deadline: deadline, allocated_to: allocated_to)
    }
    @objc func Imge_C_Click(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        Img_D_Type.image = UIImage(named: "d_light_background.png")
        Img_W_Type.image = UIImage(named: "w_light_background.png")
        Img_O_Type.image = UIImage(named: "o_light_background.png")
        Img_C_Type.image = UIImage(named: "c_dark_background.png")
        // Your action
        
        status = "Close"
        dataRequest(user_id: String(user.data.user_id), allocated: allocated, status: status, priority: priority, severity:severity, type: type, day: day, deadline: deadline, allocated_to: allocated_to)
    }
    
}

extension CenterViewController:Left_SidePanelViewControllerDelegate,Right_SidePanelViewControllerDelegate {
    func clickeventfrom_right()  {
        delegate?.collapseSidePanels()
        
    }
    func clickeventfrom_left()   {
        
        
        delegate?.collapseSidePanels()
        
        
    }
    
    
    
    func dataRequest(
user_id:String,allocated:String,status:String,priority:String,severity:String,type:String,day:String,deadline:String,allocated_to:String) {
        
         self.progressbar.isHidden = false
        
        let urlToRequest = ApiClient.baseurl+ApiClient.trackerlist
        let url4 = URL(string: urlToRequest)!
        let session4 = URLSession.shared
        let request = NSMutableURLRequest(url: url4)
        request.httpMethod = "POST"
         request.setValue("Bearer "+PrefUtil.getAccessToken(key: StaticKeys.usertoken), forHTTPHeaderField: "Authorization")
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
         let paramString = "user_id="+user_id+"&allocated="+allocated+"&status="+status+"&priority="+priority+"&severity="+severity+"&type="+type+"&day="+day+"&deadline="+deadline+"&allocated_to="+allocated_to
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        print(paramString)
        
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
                
                let loginres = try decoder.decode(TrackerList.self, from: data!)
                if(loginres.success == false){
                    self.tracker_list.removeAll()
                }else{
                     self.tracker_list = loginres.data
                }
                
    
                print(dataString)
                
                DispatchQueue.main.async {
                    
                    self.progressbar.stopAnimating()
                    self.progressbar.isHidden = true
                    self.tableview.reloadData()
                    
                    
                     self.allocated = "My"
                     self.status = "Open"
                     self.priority = ""
                     self.severity = ""
                     self.type = ""
                     self.day = ""
                     self.deadline = ""
                     self.allocated_to = ""
                }
                
                
            }catch let error {
                print("Error :  \(error)")
                
            }
            
            
            
            
            
            
            
        }
        task.resume()
        
        
        
        
    }

}



protocol CenterViewControllerDelegate {
  func toggleLeftPanel()
  func toggleRightPanel()
  func collapseSidePanels()
}




extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
