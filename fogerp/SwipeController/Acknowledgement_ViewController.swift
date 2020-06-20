//
//  Acknowledgement_ViewController.swift
//  fogerp
//
//  Created by apple on 20/06/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import UIKit

class Acknowledgement_ViewController: UIViewController {

    @IBAction func btn_leftmenu(_ sender: UIBarButtonItem) {
        clickeventfrom_left()
        print("test left click")
    }
    @IBAction func btn_rightmenu(_ sender: Any) {
      
        clickeventfrom_right()
    }
    
    
    var delegate: TestDelegate?

   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

}
extension Acknowledgement_ViewController : Left_SidePanelViewControllerDelegate,Right_SidePanelViewControllerDelegate {
    func clickeventfrom_right()  {  delegate?.collapseSidePanels()    }
    func clickeventfrom_left()   {  delegate?.collapseSidePanels()
        print("test left click 2")   }
    
    
}



protocol TestDelegate {
    func toggleLeftPanel()
    func toggleRightPanel()
    func collapseSidePanels()
}

