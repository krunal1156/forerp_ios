//
//  AddLeave_ViewController.swift
//  fogerp
//
//  Created by apple on 01/07/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import UIKit

class AddLeave_ViewController: UIViewController {

    @IBAction func backbtn_press(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
  
    @IBOutlet weak var fromdate: UIButton!
    
    @IBOutlet weak var todate: UIButton!
    
    @IBOutlet weak var leavetype: UIButton!
    
    @IBOutlet weak var leavefor: UIButton!
    @IBOutlet weak var edittextcontainer: UIView!
    
    @IBOutlet weak var btn_apply: UIButton!
    
    @IBAction func btnapply(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        fromdate.roundCorners(corners: [.topLeft,.topRight,.bottomLeft,.bottomRight], radius: 30)
        todate.roundCorners(corners: [.topLeft,.topRight,.bottomLeft,.bottomRight], radius: 30)
        leavetype.roundCorners(corners: [.topLeft,.topRight,.bottomLeft,.bottomRight], radius: 30)
        leavefor.roundCorners(corners: [.topLeft,.topRight,.bottomLeft,.bottomRight], radius: 30)
        edittextcontainer.roundCorners(corners: [.topLeft,.topRight,.bottomLeft,.bottomRight], radius: 30)
        btn_apply.roundCorners(corners: [.topLeft,.topRight,.bottomLeft,.bottomRight], radius: 30)
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
