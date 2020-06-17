//
//  home.swift
//  fogerp
//
//  Created by apple on 17/06/20.
//  Copyright © 2020 kachhua. All rights reserved.
//


import UIKit

class home_controller:UIViewController{
    
    
    var delegate : HomeControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    @objc func handleMenuToggle(){
        print("toggle click")
        delegate?.HandleMenuToggle()
    }
    func configurenavigationBar(){
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "FOG ERP"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "backdark"), style: .plain, target: self, action:#selector(handleMenuToggle))
    }
}

