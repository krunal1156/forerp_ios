//
//  Create_Task_ViewController.swift
//  fogerp
//
//  Created by apple on 30/06/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import UIKit

class Create_Task_ViewController: UIViewController {

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
    
    @IBAction func btn_back_click(_ sender: Any) {
          self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //test
        
         editcontainer.roundCorners(corners: [.topRight,.bottomRight,.topLeft,.bottomLeft], radius: 30.0)
        
         btn_do_later.roundCorners(corners: [.topLeft,.bottomLeft], radius: 30.0)
         btn_working.roundCorners(corners: [.topRight,.bottomRight], radius: 30.0)

        btn_minor.roundCorners(corners: [.topLeft,.bottomLeft], radius: 30.0)
        btn_major.roundCorners(corners: [.topRight,.bottomRight], radius: 30.0)

        
        btn_low.roundCorners(corners: [.topLeft,.bottomLeft], radius: 30.0)
        btn_high.roundCorners(corners: [.topRight,.bottomRight], radius: 30.0)

        // Do any additional setup after loading the view.
    }
    


}
