//
//  CardView.swift
//  fogerp
//
//  Created by apple on 23/06/20.
//  Copyright © 2020 kachhua. All rights reserved.
//

import UIKit

class CardView: UIView {

    @IBInspectable var cornerradius : CGFloat = 2
    @IBInspectable var shadowoffsetwidht :CGFloat = 0
    @IBInspectable var shadowoffsetheight : CGFloat = 5
    @IBInspectable var shadowcolor : UIColor = UIColor.black
    @IBInspectable var shadowopacity :CGFloat = 0.5
    
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerradius
        layer.shadowColor = shadowcolor.cgColor
        layer.shadowOffset = CGSize(width : shadowoffsetwidht ,height :shadowoffsetheight)
        let shadowpath = UIBezierPath (roundedRect: bounds, cornerRadius: cornerradius)
        layer.shadowPath = shadowpath.cgPath
        layer.shadowOpacity = Float(shadowopacity)
        
        
    }

}
