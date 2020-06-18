//
//  ViewController_DashBoard.swift
//  fogerp
//
//  Created by apple on 17/06/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import UIKit


class ViewController_DashBoard: UIViewController {

   
    @IBOutlet var MenuBtn: UIBarButtonItem!
    var testbtn : UIButton!
   
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MenuBtn.target = revealViewController()
        MenuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
        
        
        
        
        
      
    }
    
    

    
}
