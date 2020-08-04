//
//  Warning_ViewController.swift
//  fogerp
//
//  Created by apple on 25/06/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import UIKit

class Warning_ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return warning_list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "SingleRow_Warning")as! SingleRow_Warning
        cell.txt_Description.text = warning_list[indexPath.row].warning_desc
         cell.txt_Date.text = warning_list[indexPath.row].created_at
        return cell
    }
    
    @IBAction func btn_back_click(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    
     @IBOutlet weak var progressbar: UIActivityIndicatorView!
    @IBOutlet weak var tableview: UITableView!
     var warning_list = [WarningList.data]()
     var user :User!
    override func viewDidLoad() {
        super.viewDidLoad()
        user = PrefUtil.userdata() 
    
        dataRequest(user_id: String(user.data.user_id))
        
    }
    
    func dataRequest(user_id:String) {
        
        self.progressbar.isHidden = false
        
        let urlToRequest = ApiClient.baseurl+ApiClient.warniglist
        let url4 = URL(string: urlToRequest)!
        let session4 = URLSession.shared
        let request = NSMutableURLRequest(url: url4)
        request.httpMethod = "POST"
        request.setValue("Bearer "+PrefUtil.getAccessToken(key: StaticKeys.usertoken), forHTTPHeaderField: "Authorization")
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        let paramString = "user_id="+user_id
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        
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
                
                let loginres = try decoder.decode(WarningList.self, from: data!)
                if(loginres.success == false){
                    self.warning_list.removeAll()
                }else{
                    self.warning_list = loginres.data
                }
                
                
                print(dataString)
                
                DispatchQueue.main.async {
                    
                    self.progressbar.stopAnimating()
                    self.progressbar.isHidden = true
                    self.tableview.reloadData()
                    
                  
                }
                
                
            }catch let error {
                print("Error :  \(error)")
                
            }
            
            
            
            
            
            
            
        }
        task.resume()
        
        
        
        
    }
    






  
}
