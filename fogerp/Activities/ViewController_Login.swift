//
//  ViewController_Login.swift
//  fogerp
//
//  Created by Krunal Prajapati on 16/06/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import UIKit

class ViewController_Login: UIViewController {

    @IBOutlet weak var btn_ok: UIButton!
    @IBOutlet weak var edt_input: UITextField!
    
     var gameTimer: Timer! //Timer object
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        gameTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:#selector(timeaction), userInfo: nil, repeats: false)
        
        
        edt_input?.layer.cornerRadius=8
        edt_input?.textColor=UIColor.blue
        
        btn_ok?.backgroundColor = UIColor.white
        btn_ok?.setTitleColor(UIColor.orange, for:.normal)
        btn_ok?.layer.cornerRadius=8
        btn_ok?.setTitle("Request OTP", for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func bn_login_action(_ sender: Any) {
        let str_empcode:String? = edt_input.text
       
        dataRequest(emp_code: str_empcode!)
        
        
    }
    
    func dataRequest( emp_code:String) {
        
        
        let urlToRequest = ApiClient.baseurl+ApiClient.login
        let url4 = URL(string: urlToRequest)!
        let session4 = URLSession.shared
        let request = NSMutableURLRequest(url: url4)
        request.httpMethod = "POST"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        let paramString = "mob_no="+emp_code
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
                
                let loginres = try decoder.decode(LoginRes.self, from: data!)
                PrefUtil.saveAccessToken(data: loginres.data.access_token, key: StaticKeys.usertoken)
                PrefUtil.saveAccessToken(data: emp_code, key: StaticKeys.usermobile)
                print(loginres.msg)
                print(dataString)
                
                DispatchQueue.main.async {
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "VarifyMobile_ViewController") as! VarifyMobile_ViewController
                    self.present(nextViewController, animated:true, completion:nil)
                    
                }
                
                
                
            }catch let error {
                print("Error :  \(error)")
                
            }
            
            
            
            
            
            
            
        }
        task.resume()
        
        
        
        
    }
    
    
    @objc func timeaction(){
        
        let user = PrefUtil.userdata()
        
        if(user == nil){
            print("data not found")
           
            
            
        }else
        {
            
            print("data  found")
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CenterViewController") as! CenterViewController
            self.present(nextViewController, animated:true, completion:nil)
            gameTimer.invalidate()
            
        }
        
        
    }
}
