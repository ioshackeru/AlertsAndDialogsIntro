//
//  ViewController.swift
//  AlertsAndDialogs
//
//  Created by Tomer Buzaglo on 28/08/2017.
//  Copyright © 2017 iTomerBu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var alert:UIAlertController!
    
    @IBOutlet var dialogView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showCustomDialog))
        
    }
    
    func showCustomDialog(){
        self.dialogView.center.x = self.view.center.x
        self.dialogView.center.y = self.view.center.y
        
        self.dialogView.transform = CGAffineTransform(translationX: 0, y: -500)
        self.dialogView.backgroundColor = UIColor.white

        self.view.addSubview(self.dialogView)
        
        
        UIView.animate(withDuration: 0.33) {
            self.dialogView.backgroundColor = UIColor.gray
            self.dialogView.transform = CGAffineTransform.identity
        }

    }
    
    func showActionSheet(){
        let alert = UIAlertController(title: "Choose Color", message: "Pick it", preferredStyle: .actionSheet)
        
        //actionSheets only have actions!!!
        alert.addAction(UIAlertAction(title: "Red", style: .default, handler: { (action) in
            self.view.backgroundColor = UIColor.red
        }))
        
        alert.addAction(UIAlertAction(title: "Green", style: .default, handler: { (action) in
            self.view.backgroundColor = UIColor.green
        }))
        
        alert.addAction(UIAlertAction(title: "Blue", style: .default, handler: { (action) in
            self.view.backgroundColor = UIColor.blue
        }))
        
        alert.popoverPresentationController?.barButtonItem = self.navigationItem.leftBarButtonItem
        
        present(alert, animated: true, completion: nil)
    }
    
    func textChanged(){
        //alert.textFields
        let okAction = alert.actions[1]
        
        let name = alert.textFields?[0].text ?? ""
        let pass = alert.textFields?[1].text ?? ""
        
        okAction.isEnabled = name.characters.count >= 6 && pass.characters.count >= 6
        //alert.actions
    }
    func showAlertWithTextFields(){
        self.alert = UIAlertController(title: "Login❤️", message: "Please Login to continue", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "User Name..."
            
            textField.rightView = UIImageView(image: #imageLiteral(resourceName: "Message"))
            textField.rightViewMode = .always
            
            textField.addTarget(self, action: #selector(self.textChanged), for: .editingChanged)
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Password..."
            textField.isSecureTextEntry = true
            
            textField.addTarget(self, action: #selector(self.textChanged), for: .editingChanged)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Cancled")
        }
        
        let okAction = UIAlertAction(title: "Login", style: .default) { (action) in
            print("Loging you in...")
            
            let userName = self.alert.textFields?[0].text ?? ""
            let pass = self.alert.textFields?[1].text ?? ""
            
            print(userName, pass)
        }
        okAction.isEnabled = false
        alert.addAction(cancelAction) // 0
        alert.addAction(okAction) // 1
 
        present(alert, animated: true, completion: nil)
    }
    func showAlert(){
        let alert = UIAlertController(title: "Throw a Stone on Kahleessi?", message: "❄️🐉", preferredStyle: .alert)
        
        //Action is like a button:
        let okAction = UIAlertAction(title: "Sure!", style: .default){ (action) in
            print("Throwing!!!\n The dragon is pissed!")
        }
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
}














