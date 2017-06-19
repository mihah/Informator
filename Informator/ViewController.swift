//
//  ViewController.swift
//  Informator
//
//  Created by Miha Herblan on 15/02/2017.
//  Copyright © 2017 Miha Herblan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var messageTextbox: UITextField!
    @IBOutlet weak var typeSC: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //        Informator(sender: self, type: .alert, message: "test")
        
        let MB = Informator()
        MB.verticalPosition = 100
        MB.show(sender: self, type: .info, message: "offset 100")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func showMessage(_ sender: Any) {
        print(typeSC.selectedSegmentIndex)
        switch typeSC.selectedSegmentIndex {
        case 0:
            Informator(sender: self, type: .info, message: messageTextbox.text!)
        case 1:
            Informator(sender: self, type: .alert, message: messageTextbox.text!)
        case 2:
            Informator(sender: self, type: .error, message: messageTextbox.text!)
        default:
            Informator(sender: self, type: .info, message: messageTextbox.text!)
        }
    }
    
    @IBAction func info(_ sender: Any) {
        Informator(sender: self, type: .info, message: "info")
    }
    
    @IBAction func alert(_ sender: Any) {
        Informator(sender: self, type: .alert, message: "alert")
    }
    
    @IBAction func error(_ sender: Any) {
        Informator(sender: self, type: .error, message: "error")
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

