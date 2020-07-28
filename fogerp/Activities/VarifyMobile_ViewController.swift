//
//  VarifyMobile_ViewController.swift
//  fogerp
//
//  Created by apple on 28/07/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import UIKit

class VarifyMobile_ViewController: UIViewController {

    @IBOutlet weak var edt_OTP: UITextField!
    @IBOutlet weak var btn_ok: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        edt_OTP?.layer.cornerRadius=8
        edt_OTP?.textColor=UIColor.blue
        
       
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAction(_ sender: Any) {
          dataRequest(emp_code: edt_OTP.text!)
    }
    
    func dataRequest( emp_code:String) {
        
        
        let urlToRequest = ApiClient.baseurl+ApiClient.empOTPcheck
        let url4 = URL(string: urlToRequest)!
        let session4 = URLSession.shared
        let request = NSMutableURLRequest(url: url4)
        request.httpMethod = "POST"
        request.setValue("Bearer "+PrefUtil.getAccessToken(key: StaticKeys.usertoken), forHTTPHeaderField: "Authorization")
        print("token barear :"+PrefUtil.getAccessToken(key: StaticKeys.usertoken))
        print("moblie :"+PrefUtil.getAccessToken(key: StaticKeys.usermobile))
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        let paramString = "otp="+emp_code+"&mob_no="+PrefUtil.getAccessToken(key: StaticKeys.usermobile)
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
                PrefUtil.saveAccessToken(data: String(dataString!), key:StaticKeys.userdata)
                let decoder = JSONDecoder()
                print(dataString)
                
                let loginres = try decoder.decode(User.self, from: data!)
                //PrefUtil.saveU()
                print(loginres.msg)
                print(dataString)
                
                DispatchQueue.main.async {
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CenterViewController") as! ContainerViewController
                    self.present(nextViewController, animated:true, completion:nil)
                    
                }
                
                
                
            }catch let error {
                print("Error :  \(error)")
                
            }
            
            
            
            
            
            
            
        }
        task.resume()
        
        
        
        
    }

}
