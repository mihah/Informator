//
//  Informator.swift
//  Informator
//
//  Created by Miha Herblan on 15/02/2017.
//  Copyright © 2017 Miha Herblan. All rights reserved.
//

import UIKit

enum messageType{
    case info
    case alert
    case error
    
}

class Informator: UILabel {
    //
    var visible:TimeInterval = 1.0
    var verticalPosition:CGFloat = 20.0
    var height:CGFloat = 20.0
    
    
    
    var messageType:messageType?
    
    
    var messageBoxColor:UIColor{
        switch messageType! {
        case .info:
            return UIColor.green
        case .alert:
            return UIColor.yellow
        case .error:
            return UIColor.red
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult convenience init(sender:UIViewController, type:messageType, message:String){
        
        self.init(frame: CGRect.zero)
        show(sender: sender, type: type, message: message)
        
        
    }
    
    func show(sender:UIViewController, type:messageType, message:String){
        let width = sender.view.frame.width
        self.frame = CGRect(x: 0 , y: verticalPosition, width: width, height: 0)
        self.textAlignment = .center
        
        self.text = message
        messageType = type
        self.backgroundColor = messageBoxColor
        sender.view.addSubview(self)
        UIView.animate(withDuration: 1, animations: {
            //            view.frame = CGRect(x: 0, y: 20, width: self.view.frame.width, height: 40)
            self.frame = CGRect(x: 0, y: self.verticalPosition, width: width, height: 40)
        }) { (complitetd) in
            UIView.animate(withDuration: 1, delay: 2, animations: {
                //                 view.frame = CGRect(x: 0, y: 20, width: self.view.frame.width, height: 0)
                self.frame = CGRect(x: 0, y: self.verticalPosition, width: width, height: 0)
            }, completion: { (complition) in
                self.removeFromSuperview()
            })
            
        }
        
    }
    
    
    
}
