//
//  Right_SidePanelViewController.swift
//  fogerp
//
//  Created by apple on 18/06/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import UIKit

class Right_SidePanelViewController: UIViewController {

    
    @IBAction func clckrightside(_ sender: UIButton) {
        delegate?.clickeventfrom_right()
    }
    
    var delegate: Right_SidePanelViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    
}
protocol Right_SidePanelViewControllerDelegate {
    func clickeventfrom_right()
}
