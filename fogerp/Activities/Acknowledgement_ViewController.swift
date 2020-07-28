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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell  = tableView.dequeueReusableCell(withIdentifier: "SingleRow_Acknowledgement")as! SingleRow_Acknowledgement
    
        return cell
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
   override func viewDidLoad() {
        super.viewDidLoad()
    self.navigationController?.isNavigationBarHidden = true
      tableView.tableFooterView = UIView()
    

    
        // Do any additional setup after loading the view.
    }
   
    @IBAction func btn_back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

        print("click cancel")

    }
    
}

