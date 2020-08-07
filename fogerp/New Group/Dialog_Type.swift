//
//  Dialog_Type.swift
//  fogerp
//
//  Created by apple on 06/08/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import UIKit

protocol typedelegate {
    func handleType(action: String)
}

class Dialog_Type: UIViewController {

    var delegate: typedelegate?
    //MARK:- outlets for the view controller
    @IBOutlet weak var dialogBoxView: UIView!
    
    @IBOutlet weak var btn_Issue: UIButton!
    
    @IBOutlet weak var btn_Task: UIButton!
    @IBOutlet weak var btn_Question: UIButton!
    
    @IBOutlet weak var btn_Acknowledgement: UIButton!
  
    @IBAction func click_issue(_ sender: Any) {
        self.delegate?.handleType(action: "issue")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func click_task(_ sender: Any) {
        self.delegate?.handleType(action: "Task")
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func click_question(_ sender: Any) {
        self.delegate?.handleType(action: "Question")
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func click_acknowledgement(_ sender: Any) {
        self.delegate?.handleType(action: "acknowldegemetn")
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.50)
        //customizing the dialog box view
        dialogBoxView.layer.cornerRadius = 6.0
        dialogBoxView.layer.borderWidth = 1.2
       
      
    }
    

    static func showPopup(parentVC: UIViewController){
        //creating a reference for the dialogView controller
        if let popupViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Dialog_Type") as? Dialog_Type {
            popupViewController.modalPresentationStyle = .custom
            popupViewController.modalTransitionStyle = .crossDissolve
            //setting the delegate of the dialog box to the parent viewController
            popupViewController.delegate = parentVC as? typedelegate
            //presenting the pop up viewController from the parent viewController
            parentVC.present(popupViewController, animated: true)
        }
    }

}
