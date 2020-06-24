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
    override func viewDidLoad() {
        super.viewDidLoad()

        edt_input.layer.cornerRadius=8
        edt_input.textColor=UIColor.blue
        
        btn_ok.backgroundColor = UIColor.white
        btn_ok.setTitleColor(UIColor.orange, for:.normal)
        btn_ok.layer.cornerRadius=8
        btn_ok.setTitle("Request OTP", for: .normal)
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
