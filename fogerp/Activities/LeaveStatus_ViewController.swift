//
//  LeaveStatus_ViewController.swift
//  fogerp
//
//  Created by apple on 24/06/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import UIKit

class LeaveStatus_ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "SingleRow_LeaveStatus_TableViewCell")as! SingleRow_LeaveStatus_TableViewCell
        
        return cell
    }
    
    
    @IBAction func btn_back_click(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    
    
    @IBOutlet weak var btn_createleave: UIImageView!{
    didSet {
    let imageTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
    btn_createleave.addGestureRecognizer(imageTapGestureRecognizer)
    btn_createleave.isUserInteractionEnabled = true
    }
    }
    
    @objc func imageTapped() {
        //navigate to another view controller
        print("image tap")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVc = storyboard.instantiateViewController(withIdentifier: "AddLeave_ViewController") as! AddLeave_ViewController
        self.present(nextVc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
