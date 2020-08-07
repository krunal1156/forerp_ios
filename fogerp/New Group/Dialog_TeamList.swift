//
//  Dialog_TeamList.swift
//  fogerp
//
//  Created by apple on 06/08/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import UIKit


protocol PopUpDelegate {
    func handleAction(action: Bool)
}

class Dialog_TeamList: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emplist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "SingleRow_TeamList")as! SingleRow_TeamList
        cell.txtUserName.text = emplist[indexPath.row].name
        let cellNameTapped = MyTapGesture(target: self, action:     #selector(nameTapped))
        cellNameTapped.index = indexPath.row
        cell.txtUserName.isUserInteractionEnabled = true
        cell.txtUserName.addGestureRecognizer(cellNameTapped) //gesture added
        
        
        return cell
    }
    class MyTapGesture: UITapGestureRecognizer {
        var index = Int()
    }
   
    @objc func nameTapped(tapGestureRecognizer: MyTapGesture){
        print("Hello, "+emplist[tapGestureRecognizer.index].name)
        self.delegate?.handleAction(action: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    var delegate: PopUpDelegate?
    //MARK:- outlets for the view controller
    @IBOutlet weak var dialogBoxView: UIView!
    @IBOutlet weak var gotoStoreButton: UIButton!
    @IBOutlet weak var table: UITableView!
    
    @IBAction func btn_close_click(_ sender: Any) {
        self.delegate?.handleAction(action: true)
        self.dismiss(animated: true, completion: nil)
    }
    var emplist = [EmpList]()
    var user :User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        user = PrefUtil.userdata()
        
        dataRequest(user_id: String(user.data.user_id))
        
        //adding an overlay to the view to give focus to the dialog box
        view.backgroundColor = UIColor.black.withAlphaComponent(0.50)
        //customizing the dialog box view
        dialogBoxView.layer.cornerRadius = 6.0
        dialogBoxView.layer.borderWidth = 1.2
        //customizing the go to app store button
        gotoStoreButton.setTitleColor(UIColor.white, for: .normal)
        gotoStoreButton.layer.borderWidth = 1.2
        gotoStoreButton.layer.cornerRadius = 4.0
    }
    static func showPopup(parentVC: UIViewController){
        //creating a reference for the dialogView controller
        if let popupViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Dialog_TeamList") as? Dialog_TeamList {
            popupViewController.modalPresentationStyle = .custom
            popupViewController.modalTransitionStyle = .crossDissolve
            //setting the delegate of the dialog box to the parent viewController
            popupViewController.delegate = parentVC as? PopUpDelegate
            //presenting the pop up viewController from the parent viewController
            parentVC.present(popupViewController, animated: true)
    }
    }

    func dataRequest(user_id:String) {
        
        let urlToRequest = ApiClient.baseurl+ApiClient.emplist
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
                
                let loginres = try decoder.decode([EmpList].self, from: data!)
                
                self.emplist = loginres
            
                print(dataString)
                
                DispatchQueue.main.async {
                    
                   
                   // self.table.reloadData()
                    
                    
                }
                
                
            }catch let error {
                print("Error :  \(error)")
                
            }
            
            
            
            
            
            
            
        }
        task.resume()
        
        
        
        
    }
    

}
