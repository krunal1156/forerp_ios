//
//  Container_controller.swift
//  fogerp
//
//  Created by apple on 17/06/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import UIKit

class container_controller:UIViewController{
    
    
    var menucontroller : UIViewController!
    var centerController : UIViewController!
    var isExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
        configureMenuController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }
    
    func configureHomeController(){
        
        let homecontroller = home_controller()
        homecontroller.delegate = self
        
        centerController = UINavigationController(rootViewController: homecontroller)
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController(){
        
        if menucontroller == nil {
            menucontroller = menu_controller()
            view.insertSubview(menucontroller.view, at: 0)
            addChild(menucontroller)
            menucontroller.didMove(toParent: self)
            
        }
        
    }
    
    func showMenucontroller(shouldExpand: Bool){
        
        if shouldExpand {
          
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
          
        }else {
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }, completion: nil)
        }
    }
    
}


extension container_controller:HomeControllerDelegate{
    func HandleMenuToggle() {
        
        if !isExpanded {
            configureMenuController()
        }
        isExpanded != isExpanded
        
        self.showMenucontroller(shouldExpand:isExpanded)
    }
    
    
}
