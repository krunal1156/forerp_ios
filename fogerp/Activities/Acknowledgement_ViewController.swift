//
//  Acknowledgement_ViewController.swift
//  fogerp
//
//  Created by apple on 20/06/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import UIKit

class Acknowledgement_ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return announcementlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell  = tableView.dequeueReusableCell(withIdentifier: "SingleRow_Acknowledgement")as! SingleRow_Acknowledgement
        cell.txtDescription.text = announcementlist[indexPath.row].decription
         cell.txtDate.text = announcementlist[indexPath.row].created_at
    
        return cell
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var progressbar: UIActivityIndicatorView!
    var announcementlist = [AnnouncementList.data]()
    var user :User!
    
   override func viewDidLoad() {
        super.viewDidLoad()
    self.navigationController?.isNavigationBarHidden = true
      tableView.tableFooterView = UIView()
    
    user = PrefUtil.userdata()
    dataRequest(user_id: String(user.data.user_id))
    
       
    }
   
    @IBAction func btn_back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

        print("click cancel")

    }
    
    
    func dataRequest(user_id:String) {
        
        self.progressbar.isHidden = false
        
        let urlToRequest = ApiClient.baseurl+ApiClient.announcementlist
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
                
                let loginres = try decoder.decode(AnnouncementList.self, from: data!)
                if(loginres.success == false){
                    self.announcementlist.removeAll()
                }else{
                    self.announcementlist = loginres.data
                }
                
                
                print(dataString)
                
                DispatchQueue.main.async {
                    
                    self.progressbar.stopAnimating()
                    self.progressbar.isHidden = true
                    self.tableView.reloadData()
                    
                    
                }
                
                
            }catch let error {
                print("Error :  \(error)")
                
            }
            
            
            
            
            
            
            
        }
        task.resume()
        
        
        
        
    }
    
    
}

